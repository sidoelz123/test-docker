install_docker() {
  sudo apt update -y && sudo apt upgrade -y
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  echo "install done and check your docker 'docker ps'"
}

install_lzd() {
  curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
  mv ~/.local/bin/lazydocker /usr/local/bin/
  echo "success install lazydocker"
}

uninstall_docker() {
  sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
  sudo rm -rf /var/lib/docker
  sudo rm -rf /var/lib/containerd
  sudo rm /etc/apt/sources.list.d/docker.list
  sudo rm /etc/apt/keyrings/docker.asc
  echo "success uninstall docker"
}

run_app() {
  docker compose up -d
}

stop_app() {
  docker compose down
}

show_menu() {
  echo "Pilih fungsi yang ingin dijalankan:"
  echo "1) install docker"
  echo "2) install lazydocker"
  echo "3) uninstall docker"
  echo "4) start webserver"
  echo "5) stop webserver"
  echo "6) keluar script"
  read -p "Masukkan pilihan : " choice

  case $choice in
  1)
    install_docker
    ;;
  2)
    install_lzd
    ;;
  3)
    uninstall_docker
    ;;
  4)
    run_app
    ;;
  5)
    stop_app
    ;;
  6)
    echo "Keluar dari script."
    exit 0
    ;;
  *)
    echo "Pilihan tidak valid!"
    ;;
  esac

  read -p "Tekan Enter untuk kembali ke menu..."
  show_menu
}

show_menu
