Autohotkey scripts for others to use.

= Scripts =

    == normalize_window_type.ahk ==

    Gathers windows.  The primary keybind is:

        - Ctrl+Shift+Alt+g  -  Gather windows by executable of the active
                               window.

    During execution, tray tooltips will be printed indicating status.  The
    number of windows that are visible and the number is moves, especially for
    executables like exlorer.exe, will likely be inconsistent.

    It is recommended to run this script with either UI Access or as
    Administrator to be able to move windows that are run with heightened
    privileges.


    == soundswitch.ahk ==

    Uses the Sound Control Panel (mmsys.cpl) to switch devices via searching
    the listbox control.

    Default keybinds:

        - Winkey+F1  -  Activates speakers with the title of "Speakers" and
                        subtitle "Realtek High Definition Audio".
        - Winkey+F2  -  Activates speakers with the title of "Headphones" and
                        subtitle "SteelSeries Arctis 7 Game".

    You will likely want to edit the script to match your configuration.  Since
    this tends to be an operation that's increasingly rare, no configuration
    file is parsed for this and the hotkey configurations are at the top of the
    file.

    Two globals control the behavior:

        - G_ClosePropertiesOnDone  -  Set to true to close the Sound Control
                                      Panel after completion.
        - G_ShowInfoTrayTips  -  Show debugging traytips that may impact
                                 execution performance and stability.

    Because this script uses a GUI to do automatic switching, it is not
    necessarily reliable, especially when the system is under high load, focus
    is stolen, or explorer stops responding.  A more reliable program can be
    done using the Win32 APIs.  See [1] for more details on the Windows API on
    how this may be done, or look at the C# SoundSwitch library at [2] where
    the work has already been done.


    == winclick.ahk ==

    Easily shunt windows behind all other windows.  The default keybind is:

        - WinKey+RightClick  -  Move window under mouse cursor to back.

    It is recommended to run this script with either UI Access or as
    Administrator so all windows can be managed.


    == window_focus.ahk ==

    Window focus slots, providing 20 slots.  Default keybinds:

        - WinKey+(1-0)  -  Each top row number key is set to focus window in a
                           slot.  Some windows are provided as a default, and an
                           edit to the script can change this.
        - WinKey+(Num1-0)  -  Same as the previous, but for the numpad.  These
                              are different slots!
        - Ctrl+WinKey+(1-9)  -  Sets a window to be in slots 1-9.  Slot 0
                                cannot be changed by default as it is hardcoded
                                as the Task Manager slot.
        - WinKey+(Num1-0)  -  Same as the previous, but for the numpad.  These
                              are different slots!  Notably WinKey+Num0 can be
                              set.

    It is recommended to run this with either UI Access or Administrator so
    that all windows can be managed.  Any reload of the script will clear the
    changes, so be careful.  It is also recommended that you set up default
    programs for your workflow.  Windows that match multiple conditions will
    not be cycled, though that would be an awesome feature to have.



= References =

    [1] - https://docs.microsoft.com/en-us/previous-versions/aa909789(v=msdn.10)?redirectedfrom=MSDN

    [2] - https://github.com/Belphemur/SoundSwitch
