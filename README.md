# 🔍 find_commands

Herramienta de la shell para buscar rápidamente en un índice personal de comandos, herramientas y protocolos usados en ciberseguridad.

---

## Actualización

Tras un largo tiempo de uso de esta herramienta he decidido hacer una actualización para mejorar la legibilidad del [índice](./index.yaml), llevándolo de `.txt` a `.yaml` usando la herramienta `yq`.

* Ahora puedes filtrar por categorías de herramientas.

---

## ¿Por qué existe esta herramienta?

Cuando estoy practicando en plataformas como **TryHackme** y **OverTheWire**, acumulo comandos, flags y flujos de trabajo que necesito consultar frecuentemente. En lugar de buscar en internet cada vez, mantengo un `index.yaml` con mis propias notas y este script me permite consultarlo directamente desde la terminal.

---

## Características

- Panel de ayuda: (`-h`)
- Lista todos los **paquetes** y **servicios** disponibles (`-l`)
- Búsqueda por **comando** o **aparición** en el documento (`-c`)
- Búsqueda por **título** de herramienta o protocolo (`-k`)
- Búsqueda de **programas** o **servicios** por categoría (`-a`) (*¡NUEVA FUNCIONALIDAD! - Las categorías están listadas en la ayuda*)
- Validación de argumentos y mensajes de error según sea el caso

---

## Instalación

```bash
# Clonar el repositorio
git clone https://github.com/PFPE20/find_commands.git
cd find_comands

# Dar permisos de ejecución
chmod +x find_commands.sh

# (recomendación) Añadir al $PATH con syslink
sudo ln -s "$(pwd)/find_command.sh" /usr/local/bin/find_command

# O también puedes agregarlo como alias al archivo .bash_aliases
findcommands='ruta/al/script'
```

---

## Uso

```bash
find_command [ -l | -k | -c | -h | -a] <término>
```

| Flag | Descripción |
|------|-------------|
|  -l  | Lista todos los servicios y paquetes |
|  -k  | Busca por título en el índice (ej: `"SSH"`, `"nmap"`) |
|  -c  | Busca apariciones en el documento |
|  -a  | Busca por categoría |
|  -h  | Muestra la ayuda |


### Ejemplos

```bash
# Buscar las notas del bloque "SSH"
find_commands -k ssh

# Buscar cualquier mención a "john" en el índice
find_commands -c john
```

---

## Estructura del proyecto:

```
find_commands/
├── find_commands.sh    # Script principal
└── index.txt           # Índice personal de comandos (ejemplo)
```

### Recomendaciones

Intenta mantener el formato del `.yaml` para que no ocurran errores con la búsqueda. La información que aportes será totalmente de tu criterio.

>[!TIP]
>Siéntanse libres de usarla y modificarla a su gusto

---

## Contexto

Soy aprendíz de ciberseguridad construyendo mi propio entorno desde cero. Este repositorio forma parte de mis herramientas de estudio y seguirá creciendo junto con mi aprendizaje.

**Plataformas donde practico:** TryHackMe, PicoCTF, OverTheWire, CTFLearn, PortSwigger

---

## Autor

**PFPE20** - Estudiante de ciberseguridad


