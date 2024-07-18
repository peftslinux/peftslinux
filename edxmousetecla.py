import subprocess
from pynput import mouse, keyboard
import threading

# Função para abrir o teclado virtual
def abrir_teclado_virtual():
    try:
        # Comando para abrir o teclado virtual no Windows
        subprocess.run(['osk'])
    except Exception as e:
        print(f"Erro ao abrir o teclado virtual: {e}")

# Variáveis globais para controlar o estado dos botões do mouse
botao_esquerdo_pressionado = False
botao_direito_pressionado = False

# Lock para evitar condições de corrida
lock = threading.Lock()

# Listener de eventos do mouse
def on_click(x, y, button, pressed):
    global botao_esquerdo_pressionado, botao_direito_pressionado
    
    with lock:
        if button == mouse.Button.left:
            botao_esquerdo_pressionado = pressed
        elif button == mouse.Button.right:
            botao_direito_pressionado = pressed
        
        # Verifica se ambos os botões estão pressionados simultaneamente
        if botao_esquerdo_pressionado and botao_direito_pressionado:
            abrir_teclado_virtual()

# Listener de eventos do teclado (para finalizar o script com ESC)
def on_press(key):
    try:
        if key == keyboard.Key.esc:
            # Para os listeners ao pressionar ESC
            return False
    except AttributeError:
        pass

# Função principal para iniciar os listeners
def main():
    with mouse.Listener(on_click=on_click) as mouse_listener, keyboard.Listener(on_press=on_press) as keyboard_listener:
        mouse_listener.join()
        keyboard_listener.join()

if __name__ == "__main__":
    main()

