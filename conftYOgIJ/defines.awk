BEGIN {
D["PACKAGE_NAME"]=" \"minicom\""
D["PACKAGE_TARNAME"]=" \"minicom\""
D["PACKAGE_VERSION"]=" \"2.7\""
D["PACKAGE_STRING"]=" \"minicom 2.7\""
D["PACKAGE_BUGREPORT"]=" \"minicom-devel@lists.alioth.debian.org\""
D["PACKAGE_URL"]=" \"\""
D["PACKAGE"]=" \"minicom\""
D["VERSION"]=" \"2.7\""
D["STDC_HEADERS"]=" 1"
D["HAVE_SYS_TYPES_H"]=" 1"
D["HAVE_SYS_STAT_H"]=" 1"
D["HAVE_STDLIB_H"]=" 1"
D["HAVE_STRING_H"]=" 1"
D["HAVE_MEMORY_H"]=" 1"
D["HAVE_STRINGS_H"]=" 1"
D["HAVE_INTTYPES_H"]=" 1"
D["HAVE_STDINT_H"]=" 1"
D["HAVE_UNISTD_H"]=" 1"
D["__EXTENSIONS__"]=" 1"
D["_ALL_SOURCE"]=" 1"
D["_GNU_SOURCE"]=" 1"
D["_POSIX_PTHREAD_SEMANTICS"]=" 1"
D["_TANDEM_SOURCE"]=" 1"
D["HAVE_ICONV"]=" 1"
D["USE_SOCKET"]=" 1"
D["ENABLE_NLS"]=" 1"
D["HAVE_GETTEXT"]=" 1"
D["HAVE_DCGETTEXT"]=" 1"
D["KERMIT"]=" \"\""
D["HAVE_TERMCAP_H"]=" 1"
D["HAVE_DIRENT_H"]=" 1"
D["STDC_HEADERS"]=" 1"
D["HAVE_SYS_WAIT_H"]=" 1"
D["TIME_WITH_SYS_TIME"]=" 1"
D["GWINSZ_IN_SYS_IOCTL"]=" 1"
D["POSIX_TERMIOS"]=" 1"
D["HAVE_STDARG_H"]=" 1"
D["HAVE_TERMIO_H"]=" 1"
D["HAVE_TERMIOS_H"]=" 1"
D["HAVE_SETJMP_H"]=" 1"
D["HAVE_ERRNO_H"]=" 1"
D["HAVE_PWD_H"]=" 1"
D["HAVE_SIGNAL_H"]=" 1"
D["HAVE_FCNTL_H"]=" 1"
D["HAVE_SGTTY_H"]=" 1"
D["HAVE_LOCALE_H"]=" 1"
D["HAVE_SYS_STAT_H"]=" 1"
D["HAVE_SYS_FILE_H"]=" 1"
D["HAVE_SYS_IOCTL_H"]=" 1"
D["HAVE_SYS_TIME_H"]=" 1"
D["HAVE_SYS_PARAM_H"]=" 1"
D["HAVE_UNISTD_H"]=" 1"
D["HAVE_SGTTY_H"]=" 1"
D["HAVE_FEATURES_H"]=" 1"
D["RETSIGTYPE"]=" void"
D["HAVE_GETCWD"]=" 1"
D["HAVE_GETWD"]=" 1"
D["HAVE_MEMMOVE"]=" 1"
D["HAVE_STRERROR"]=" 1"
D["HAVE_STRSTR"]=" 1"
D["HAVE_VSNPRINTF"]=" 1"
D["HAVE_VPRINTF"]=" 1"
D["HAVE_SELECT"]=" 1"
D["HAVE_SNPRINTF"]=" 1"
D["HAVE_USLEEP"]=" 1"
D["HAVE_GETOPT"]=" 1"
D["HAVE_GETOPT_LONG"]=" 1"
D["HAVE_LONG_FILE_NAMES"]=" 1"
D["UUCPLOCK"]=" \"/var/lock\""
D["DFL_PORT"]=" \"/dev/ttyS1\""
D["DEF_BAUD"]=" \"115200\""
  for (key in D) D_is_set[key] = 1
  FS = ""
}
/^[\t ]*#[\t ]*(define|undef)[\t ]+[_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ][_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789]*([\t (]|$)/ {
  line = $ 0
  split(line, arg, " ")
  if (arg[1] == "#") {
    defundef = arg[2]
    mac1 = arg[3]
  } else {
    defundef = substr(arg[1], 2)
    mac1 = arg[2]
  }
  split(mac1, mac2, "(") #)
  macro = mac2[1]
  prefix = substr(line, 1, index(line, defundef) - 1)
  if (D_is_set[macro]) {
    # Preserve the white space surrounding the "#".
    print prefix "define", macro P[macro] D[macro]
    next
  } else {
    # Replace #undef with comments.  This is necessary, for example,
    # in the case of _POSIX_SOURCE, which is predefined and required
    # on some systems where configure will not decide to define it.
    if (defundef == "undef") {
      print "/*", prefix defundef, macro, "*/"
      next
    }
  }
}
{ print }
