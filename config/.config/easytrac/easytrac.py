"""TimeTrac made easy."""
import datetime
import pathlib
import pickle
import sys

from googleapiclient.discovery import build
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request

# If modifying these scopes, delete the file token.pickle.
SCOPES = ['https://www.googleapis.com/auth/calendar.readonly']


def get_week(year, calendar_week):
    monday_str = f"{year}-{calendar_week}-1"
    dt_fmt = "%Y-%W-%w"
    monday = datetime.datetime.strptime(monday_str, dt_fmt)
    monday = monday + datetime.timedelta(days=0.125)
    sunday = monday + datetime.timedelta(days=6.750)
    return monday, sunday


def str_to_datetime(str_):
    """Convert an RFC3339 format date time string to a datetime object."""
    fmt = "%Y-%m-%dT%H:%M:%S"
    dt = datetime.datetime.strptime(str_[:-6], fmt)
    return dt


def usage():
    """Return the usage of this script as a string."""
    usg = "\n".join([
        "EasyTrac - FEops's ridiculous TimeTrac policy made easy.",
        "",
        "This script gets the given week's proper time registration from your",
        "primary Google calendar and shows you each project you've worked on",
        "that week and how long you've worked on it, along with the total",
        "amount of hours worked the whole week.",
        "",
        "This information can be used to easily fill out FEops's TrimeTrac",
        "according to the ridiculous rule 'max 40 hours, 8 hours Mon - Fri'.",
        "",
        "Usage:",
        "",
        "    $ python3 easytrac.py <week> <year>",
        "",
    ])
    return usg


def main():
    """Do the thing."""
    # Parse the command-line arguments.
    if len(sys.argv) != 3:
        print(usage())
        return
    try:
        week = int(sys.argv[1])
        year = int(sys.argv[2])
    except ValueError:
        print(usage())
        return

    # Get the first and last days of the given week.
    monday, sunday = get_week(year, week-1)

    # Credential stuff.
    creds = None
    token_fp = pathlib.Path(__file__).parent.resolve()/"token.pickle"
    credentials_fp = pathlib.Path(__file__).parent.resolve()/"credentials.json"
    if token_fp.is_file():
        with open(token_fp, 'rb') as token:
            creds = pickle.load(token)
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            flow = InstalledAppFlow.from_client_secrets_file(
                credentials_fp, SCOPES)
            creds = flow.run_local_server(port=0)
        # Save the credentials for the next run
        with open(token_fp, 'wb') as token:
            pickle.dump(creds, token)
    service = build('calendar', 'v3', credentials=creds)

    # Call the Calendar API to get all events from that week.
    time_min = monday.isoformat() + "Z"
    time_max = sunday.isoformat() + "Z"
    events_result = service.events().list(calendarId="primary",
        timeMin=time_min, timeMax=time_max, singleEvents=True,
        orderBy="startTime").execute()
    events = events_result.get("items")

    # Create a dictionary of the total duration of each event type.
    durations = {}
    for event in events:
        # Get the event type, skip if there is none.
        summary = event["summary"]
        if ":" not in summary:
            continue
        event_type = summary.split(":")[0]
        # Get the event duration.
        start_str = event["start"].get("dateTime")
        start = str_to_datetime(start_str)
        end_str = event["end"].get("dateTime")
        end = str_to_datetime(end_str)
        duration = (end-start).total_seconds()/3600
        # Add to the collection.
        if event_type not in durations:
            durations[event_type] = 0.
        durations[event_type] += duration

    # Print the result.
    week_header = f"week {week} ({monday.date()} to {sunday.date()})"
    if not durations:
        print(f"No data for {week_header}!")
        return
    print(f"{week_header}:".capitalize())
    for event_type, duration in durations.items():
        print(f"{event_type}: {duration}")
    print(f"Total: {sum(durations.values())}")

if __name__ == '__main__':
    main()
