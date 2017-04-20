"""Show a popup menu containing a summary of useful keyboard shortcuts."""
import sublime_plugin

# This thing should go in a JSON file or something...
commands = [
    {
        "text": "Goto Anything... - Ctrl+P",
        "command": "show_overlay",
        "args": {
            "overlay": "goto",
            "show_files": True,
        },
    },
    {
        "text": "Goto Symbol... -C trl+R",
        "command": "show_overlay",
        "args": {
            "overlay": "goto",
            "text": "@",
        },
    },
    {
        "text": "Goto Line... - Ctrl+G",
        "command": "show_overlay",
        "args": {
            "overlay": "goto",
            "text": ":",
        },
    },
    {
        "text": "Command Palette... - Ctrl+Shift+P",
        "command": "show_overlay",
        "args": {
            "overlay": "command_palette",
        },
    },
    {
        "text": "Quick Switch Project - Ctrl+Alt+P",
        "command": "prompt_select_workspace",
        "args": {},
    },
    {
        "text": "Close File - Ctrl+W",
        "command": "close",
        "args": {},
    },
    {
        "text": "Close Project - Ctrl+Alt+W",
        "command": "close_workspace",
        "args": {},
    },
    {
        "text": "----",
        "command": "",
        "args": {}
    },
    {
        "text": "Open Terminal at File - Ctrl+Shift+T",
        "command": "open_terminal",
        "args": {},
    },
    {
        "text": "Open Terminal at Project - Ctrl+Alt+Shift+T",
        "command": "open_terminal_project_folder",
        "args": {},
    },
    {
        "text": "----",
        "command": "",
        "args": {}
    },
    {
        "text": "Indent - Ctrl+]",
        "command": "indent",
        "args": {},
    },
    {
        "text": "Unindent - Ctrl+[",
        "command": "unindent",
        "args": {},
    },
    {
        "text": "Toggle Comment - Ctrl+/",
        "command": "toggle_comment",
        "args": {
            "block": False,
        },
    },
    {
        "text": "Lower Case - Ctrl+KL",
        "command": "lower_case",
        "args": {},
    },
    {
        "text": "Upper Case - Ctrl+KU",
        "command": "upper_case",
        "args": {},
    },
    {
        "text": "----",
        "command": "",
        "args": {}
    },
    {
        "text": "Insert Line Before - Ctrl+Shift+Enter",
        "command": "run_macro_file",
        "args": {
            "file": "res://Packages/Default/Add Line Before.sublime-macro",
        },
    },
    {
        "text": "Insert Line After - Ctrl+Enter",
        "command": "run_macro_file",
        "args": {
            "file": "res://Packages/Default/Add Line.sublime-macro",
        },
    },
    {
        "text": "Duplicate Line - Ctrl+Shift+D",
        "command": "duplicate_line",
        "args": {},
    },
    {
        "text": "Join Lines - Ctrl+J",
        "command": "join_lines",
        "args": {},
    },
    {
        "text": "Delete Line - Ctrl+Shift+K",
        "command": "run_macro_file",
        "args": {
            "file": "res://Packages/Default/Delete Line.sublime-macro",
        },
    },
    {
        "text": "Delete To Beginning - Ctrl+Shift+Backspace",
        "command": "run_macro_file",
        "args": {
            "file": "res://Packages/Default/Delete to Hard BOL.sublime-macro",
        },
    },
    {
        "text": "Delete To End - Ctrl+KK",
        "command": "run_macro_file",
        "args": {
            "file": "res://Packages/Default/Delete to Hard EOL.sublime-macro",
        },
    },
    {
        "text": "----",
        "command": "",
        "args": {}
    },
    {
        "text": "Transpose - Ctrl+T",
        "command": "transpose",
        "args": {},
    },
    {
        "text": "Swap Line Up - Ctrl+Shift+Up",
        "command": "swap_line_up",
        "Args": {},
    },
    {
        "text": "Swap Line Down - Ctrl+Shift+Down",
        "command": "swap_line_down",
        "args": {},
    },
    {
        "text": "Sort Lines - F9",
        "command": "sort_lines",
        "args": {
            "case_sensitive": False,
        },
    },
    {
        "text": "Sort Lines (Case Sensitive) - Ctrl+F9",
        "command": "sort_lines",
        "args": {
            "case_sensitive": True,
        },
    },
    {
        "text": "Wrap Paragraph At Ruler - Alt+Q",
        "command": "wrap_lines",
        "args": {},
    },
]

class ShowKeyboardShortcutsCommand(sublime_plugin.TextCommand):
    """Defines the show_keyboard_shortcuts command."""

    def run(self, edit):  ## pylint: disable=W0613
        """Called when the command is executed."""
        if self.view.settings().get('is_widget'):
            return
        keys = [x["text"] for x in commands]
        self.view.show_popup_menu(keys, self.execute)

    def execute(self, cmd_index):
        """Execute the selected command."""
        if cmd_index == -1:
            return
        cmd = commands[cmd_index]
        command = cmd["command"]
        args = cmd["args"]
        self.view.window().run_command(command, args)
