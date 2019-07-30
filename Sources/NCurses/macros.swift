// Swift definitions of the complex macros that cannot be imported from C
@_exported import CNCurses

public func NCURSES_BITS(_ mask: UInt, _ shift: UInt) -> CInt { return CInt( mask << (shift + UInt(NCURSES_ATTR_SHIFT))) }

public let A_ATTRIBUTES = NCURSES_BITS(.max, 0)
public let A_CHARTEXT = NCURSES_BITS(1, 0) - 1
public let A_COLOR = NCURSES_BITS((1 << 8) - 1, 0)
public let A_STANDOUT = NCURSES_BITS(1, 8)
public let A_UNDERLINE = NCURSES_BITS(1, 9)
public let A_REVERSE = NCURSES_BITS(1, 10)
public let A_BLINK = NCURSES_BITS(1, 11)
public let A_DIM = NCURSES_BITS(1, 12)
public let A_BOLD = NCURSES_BITS(1, 13)
public let A_ALTCHARSET = NCURSES_BITS(1, 14)
public let A_INVIS = NCURSES_BITS(1, 15)
public let A_PROTECT = NCURSES_BITS(1, 16)
public let A_HORIZONTAL = NCURSES_BITS(1, 17)
public let A_LEFT = NCURSES_BITS(1, 18)
public let A_LOW = NCURSES_BITS(1, 19)
public let A_RIGHT = NCURSES_BITS(1, 20)
public let A_TOP = NCURSES_BITS(1, 21)
public let A_VERTICAL = NCURSES_BITS(1, 22)
public let A_ITALIC = NCURSES_BITS(1, 23)

public typealias Window = UnsafeMutablePointer<WINDOW>

public func getyx(_ window: Window, _ y: inout CInt, _ x: inout CInt) {
    y = getcury(window)
    x = getcurx(window)
}

public func getbegyx(_ window: Window, _ y: inout CInt, _ x: inout CInt) {
    y = getbegy(window)
    x = getbegx(window)
}

public func getmaxyx(_ window: Window, _ y: inout CInt, _ x: inout CInt) {
    y = getmaxy(window)
    x = getmaxx(window)
}

public func getparyx(_ window: Window, _ y: inout CInt, _ x: inout CInt) {
    y = getpary(window)
    x = getparx(window)
}

public func getsyx(_ y: inout CInt, _ x: inout CInt) {
    guard let newscr = newscr else { return }
    if is_leaveok(newscr) {
        y = -1
        x = -1
    } else {
        getyx(newscr, &y, &x)
    }
}

public func setsyx(_ y: CInt, _ x: CInt) {
    guard let newscr = newscr else { return }
    if (y == -1 && x == -1) {
        leaveok(newscr, true)
    } else {
        leaveok(newscr, false)
        wmove(newscr, y, x)
    }
}


public func fixterm() -> CInt { return reset_prog_mode() }

public func resetterm() -> CInt { return reset_shell_mode() }

public func saveterm() -> CInt { return def_prog_mode() }

public func crmode() -> CInt { return cbreak() }

public func nocrmode() -> CInt { return nocbreak() }

public func gettmode() { return }
