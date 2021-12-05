import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

myKeys =
	[ ("M-p", spawn "rofi -show combi -modi combi") ] -- rofi

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Main configuration, override the defaults to your liking.
myConfig = desktopConfig { modMask 						= mod4Mask
												 , borderWidth				= 2
												 , focusFollowsMouse 	= False
												 , terminal						= "gnome-terminal"
												 } `additionalKeysP` myKeys

