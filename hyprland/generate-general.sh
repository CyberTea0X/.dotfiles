#!/bin/bash

# Получаем разрешение монитора
resolution=$(hyprctl monitors | awk '/^Monitor/{getline; print $1}' | cut -d'@' -f1)
width=$(echo "$resolution" | cut -d'x' -f1)

# Проверяем, что разрешение получено корректно
if ! [[ "$width" =~ ^[0-9]+$ ]]; then
    echo "Ошибка: Не удалось определить разрешение монитора" >&2
    exit 1
fi

# Определяем gaps в зависимости от ширины монитора
if [ "$width" -le 1920 ]; then
    gaps_in=3
    gaps_out=10
else
    gaps_in=5
    gaps_out=20
fi

# Генерируем секцию general
cat <<EOF > ~/.config/hypr/generated_general.conf
general {
    gaps_in = $gaps_in
    gaps_out = $gaps_out

    border_size = 2

    col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
    col.inactive_border = rgba(595959aa)

    resize_on_border = true
    allow_tearing = false

    layout = dwindle
}
EOF
