# Reset PATH
# export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

# Add /usr/local/sbin if it is not in PATH
case ":${PATH}:" in
    *:"/usr/local/sbin":*)
        ;;
    *)
        export PATH="/usr/local/sbin:$PATH"
        ;;
esac

# Add /usr/local/bin if it is not in PATH
case ":${PATH}:" in
    *:"/usr/local/bin":*)
        ;;
    *)
        export PATH="/usr/local/bin:$PATH"
        ;;
esac
