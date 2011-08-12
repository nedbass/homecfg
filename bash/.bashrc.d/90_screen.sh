#####################################
# Start Automatic screen Invocation #
#####################################

# If we are coming from an interactive remote SSH connection, then
# automatically put us into a screen(1) session.
# Only try once -- To avoid looping if screen fails for some reason, if
# $STARTED_SCREEN is set don't try again.
#
# See Also: http://taint.org/wk/RemoteLoginAutoScreen

if [ "$PS1" != "" -a "${STARTED_SCREEN:-x}" = x -a "${SSH_TTY:-x}" != x ]
then
	export STARTED_SCREEN=1
	export SCREEN_LOGIN_SESSION=${USER}-login

	if [ "x`screen -list | grep ${SCREEN_LOGIN_SESSION}`" = x ]; then
		screen -S ${SCREEN_LOGIN_SESSION}
	else
		screen -d -r ${SCREEN_LOGIN_SESSION}
	fi
fi

###################################
# End Automatic screen Invocation #
###################################
