#!/bin/sh
rpl='key <CAPS> \{ repeat=no, type\[group1\]=\"ALPHABETIC\", symbols\[group1\]=\[ Caps_Lock, Caps_Lock \],actions\[group1\]=\[LockMods\(modifiers=Lock\),Private\(type=3,data\[0\]=1,data\[1\]=3,data\[2\]=3\) \] \}'

# KLavye tanımı için bir kopya oluştur
xkbcomp -xkb $DISPLAY keyboardmap

# CAPS Değişimi
sed -i "s/key <CAPS>[^;]*/$rpl/" keyboardmap

# Uygulama
xkbcomp keyboardmap $DISPLAY

# Geçici oluşturulan kopyayı sil
rm keyboardmap

# script provided by GrindamN from Ubuntu Budgie Team. For further information you might visit this website and give some credit to these awesome guys. https://discourse.ubuntubudgie.org/t/caps-lock-delay-fix/4085
