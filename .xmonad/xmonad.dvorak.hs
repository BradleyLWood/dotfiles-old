import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

import XMonad.Util.Run(spawnPipe, hPutStrLn)
import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.Ungrab

import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders ( noBorders )

import XMonad.Hooks.EwmhDesktops

--------------------------------------------------------------------------------

main :: IO ()
main = do
     xmproc <- spawnPipe "xmobar /home/bradley/.xmonad/xmobarrc"
     xmonad $ ewmh $ docks $ defaultConfig
            { modMask            = mod4Mask
						, keys               = myKeys
            , layoutHook         = myLayout
            , manageHook         = myManageHook
            , terminal           = myTerminal
            , borderWidth        = myBorderWidth
            , normalBorderColor  = myNormalBorderColor
            , focusedBorderColor = myFocusedBorderColor
            , focusFollowsMouse  = myFocusFollowsMouse
						, clickJustFocuses   = myClickJustFocuses
            , logHook            = dynamicLogWithPP $ myXmobarPP xmproc
            }
          `additionalKeysP`
            [ ("M-S-z", spawn "xscreensaver-command -lock")
            , ("M-S-=", unGrab *> spawn "scrot -s"        )
            ]

--------------------------------------------------------------------------------

myTerminal      = "alacritty"
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False
myClickJustFocuses  :: Bool
myClickJustFocuses  = False
myBorderWidth   = 2
myNormalBorderColor  = "#434C5E"
myFocusedBorderColor = "#B48EAD"

myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore
    , isDialog                      --> doFloat
    ]

--------------------------------------------------------------------------------

myLayout = avoidStruts $ withSpaces tiled ||| noBorders Full ||| withSpaces (Mirror tiled )
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100
    withSpaces layout = spacingWithEdge 10 $ layout

--------------------------------------------------------------------------------
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm,               xK_o     ), spawn "rofi -show combi -modi combi")
    , ((modm .|. shiftMask, xK_c     ), kill)
    , ((modm,               xK_space ), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    , ((modm,               xK_r     ), refresh)
    , ((modm,               xK_Tab   ), windows W.focusDown)
    , ((modm,               xK_h     ), windows W.focusDown)
    , ((modm,               xK_t     ), windows W.focusUp  )
    , ((modm,               xK_m     ), windows W.focusMaster  )
    , ((modm,               xK_Return), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_h     ), windows W.swapDown  )
    , ((modm .|. shiftMask, xK_j     ), windows W.swapUp    )
    , ((modm,               xK_d     ), sendMessage Shrink)
    , ((modm,               xK_n     ), sendMessage Expand)
		-- TODO chose something else that makes sense since t is used
    --, ((modm,               xK_t     ), withFocused $ windows . W.sink)
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    , ((modm              , xK_b     ), sendMessage ToggleStruts)
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

--------------------------------------------------------------------------------

myXmobarPP xmproc = def
    { ppSep             = white " | "
    , ppTitle           = green . shorten 40
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap "<" ">"
    , ppVisible         = white
    , ppHidden          = lowWhite
    , ppUrgent          = red . wrap "!" "!"
    , ppOutput          = hPutStrLn xmproc
    }
  where
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30
    --red, blue, green, white, lowWhite, yellow, magenta :: String -> String
    red      = xmobarColor "#BF616A" ""
    green    = xmobarColor "#A3BE8C" ""
    blue     = xmobarColor "#81A1C1" ""
    white    = xmobarColor "#E5E9F0" ""
    lowWhite = xmobarColor "#586266" ""
    yellow   = xmobarColor "#EBCB8B" ""
    magenta  = xmobarColor "#B48EAD" ""

