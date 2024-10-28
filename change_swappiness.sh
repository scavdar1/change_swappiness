#!/bin/bash

# Geçerli swappiness değerini göster
echo "Geçerli swappiness değeri: $(cat /proc/sys/vm/swappiness)"

# Yeni swappiness değerini al
read -p "Yeni swappiness değeri (0-100): " yeni_swappiness

# Yeni değer olup olmadığını kontrol et
if [[ "$yeni_swappiness" =~ ^[0-9]+$ ]] && [ "$yeni_swappiness" -ge 0 ] && [ "$yeni_swappiness" -le 100 ]; then
    # Swappiness değerini ayarla
    sudo sysctl vm.swappiness=$yeni_swappiness
    echo "Swappiness değeri $yeni_swappiness olarak ayarlandı."

    # Kalıcı hale getirmek için dosyaya yaz
    echo "vm.swappiness=$yeni_swappiness" | sudo tee -a /etc/sysctl.conf > /dev/null
else
    echo "Lütfen 0 ile 100 arasında geçerli bir değer girin."
fi
