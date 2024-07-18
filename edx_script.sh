#!/bin/bash

# Função para exibir o menu
function show_menu() {
    echo "Escolha uma opção:"
    echo "1. Salvar modificações do sistema de arquivos em um módulo"
    echo "2. Converter módulo .sb em um diretório"
    echo "3. Converter diretório em módulo .sb"
    echo "4. Apagar diretório criado por sb2dir"
    echo "5. Gerar arquivo ISO edx com novos módulos"
    echo "6. Ativar módulo em tempo real"
    echo "7. Desativar módulo em tempo real"
    echo "8. Sair"
}

# Função para salvar modificações do sistema de arquivos em um módulo
function save_changes() {
    read -p "Digite o nome do arquivo de módulo (ex: target.sb): " module_file
    edxsavechanges "$module_file"
}

# Função para converter módulo .sb em um diretório
function sb_to_dir() {
    read -p "Digite o nome do arquivo de módulo (ex: module.sb): " module_file
    edxsb2dir "$module_file"
}

# Função para converter diretório em módulo .sb
function dir_to_sb() {
    read -p "Digite o nome do diretório: " directory
    read -p "Digite o nome do arquivo de módulo (ex: directory.sb): " module_file
    edxdir2sb "$directory" "$module_file"
}

# Função para apagar diretório criado por sb2dir
function rm_sb_dir() {
    read -p "Digite o nome do diretório a ser apagado: " directory
    edxrmsbdir "$directory"
}

# Função para gerar arquivo ISO Slax com novos módulos
function gen_iso() {
    read -p "Digite o nome do arquivo ISO (ex: edx.iso): " iso_file
    read -p "Digite o nome do arquivo de módulo (ex: module.sb): " module_file
    genedxiso "$iso_file" "$module_file"
}

# Função para ativar módulo em tempo real
function activate_module() {
    read -p "Digite o nome do arquivo de módulo (ex: module.sb): " module_file
    edx activate "$module_file"
}

# Função para desativar módulo em tempo real
function deactivate_module() {
    read -p "Digite o nome do arquivo de módulo (ex: module.sb): " module_file
    edx deactivate "$module_file"
}

# Loop principal
while true; do
    show_menu
    read -p "Escolha uma opção: " choice
    case $choice in
        1) save_changes ;;
        2) sb_to_dir ;;
        3) dir_to_sb ;;
        4) rm_sb_dir ;;
        5) gen_iso ;;
        6) activate_module ;;
        7) deactivate_module ;;
        8) break ;;
        *) echo "Opção inválida!" ;;
    esac
done

echo "Script encerrado."

