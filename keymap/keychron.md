i use Keychron Q10 Max keyboard, which does not support via(yet in 2025)    
config it by [Keychron lanucher](https://launcher.keychron.com/#/keymap) which recommonded by keychron , or using raw QMK

nothing too special, just homerow mod and some thumbs key changes  
the homerow mod is configured by using custom keymap in the keychron lanucher tab   
in which you tap in the QMK key code
```
Left homerow modifiers on keys A, S, D, F
******************************************
MT(MOD_LGUI,KC_A) 
MT(MOD_LALT,KC_S) 
MT(MOD_LCTL,KC_D) 
MT(MOD_LSFT,KC_F)


Right homerow modifiers on keys J, K, L, ;
*******************************************
MT(MOD_RSFT,KC_J)
MT(MOD_RCTL,KC_K)
MT(MOD_RALT,KC_L)
MT(MOD_RGUI,KC_SCLN) 
```

change left space key into  ``LT(3,KC_SPC) ``   which behave tap to space, hold to layer 3  
right space key into ``Backspace``  
fn key between two separate space key mod into ``Enter``
