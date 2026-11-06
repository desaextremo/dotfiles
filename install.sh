#!/bin/bash
echo "🦖 Replicando entorno de Desarrollo Extremo..."

# 1. Instalar Starship y crear carpetas
curl -sS https://starship.rs/install.sh | sh -s -- -y
mkdir -p ~/.config/kitty ~/img ~/.local/share/fonts

# 2. Descargar e instalar la fuente JetBrains Mono
echo "Descargando tipografía..."
wget -qO JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -qo JetBrainsMono.zip -d ~/.local/share/fonts
fc-cache -fv && rm JetBrainsMono.zip

# 3. Enlazar archivos (Symlinks) y copiar imagen
echo "Aplicando configuraciones..."
ln -sf ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/starship/starship.toml ~/.config/starship.toml
cp ~/dotfiles/img/desaextremo_kitty_grande.png ~/img/

# 4. Inyectar Starship en bashrc si no existe
if ! grep -q "starship init bash" ~/.bashrc; then
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
fi

echo "✅ Entorno replicado con éxito. Reinicia la terminal."
