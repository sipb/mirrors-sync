MIRRORDIR=/ifs/mirror

rsync () {
    # Ignore these exit statuses from rsync:
    #   23  Partial transfer due to error
    #   24  Partial transfer due to vanished source files
    command rsync "$@" || (
        case "$?" in
            23 | 24) echo "mirrors.mit.edu: Ignoring rsync exit status $?" >&2;;
            *) exit $?
        esac
    )
}
