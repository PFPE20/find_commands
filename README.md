# 🔍 find_commands

Herramienta de la shell para buscar rápidamente en un índice personal de comandos, herramientas y protocolos usados en ciberseguridad.

--- 

## ¿Por qué existe esta herramienta?

Cuando estoy practicando en plataformas como **TryHackme** y **PicoCTF**, acumulo comandos, flags y flujos de trabajo que necesito consultar frecuentemente. En lugar de buscar en internet cada vez, mantengo un `index.txt` con mis propias notas y este script me permite consultarlo directamente desde la terminal.

---

## Características

- Búsqueda por **título** de herramienta o protocolo (`-k`)
- Búsqueda por **comando** o **aparición** en el documento (`-c`)
- Extrae el **bloque completo** de notas delimitado por separadores
- Validación de argumentos y mensajes de error según sea el caso

---

## Instalación

```bash
# Clonar el repositorio
git clone <url>
cd find_comands

# Dar permisos de ejecución
chmod 777 find_commands.sh

# (recomendación) Añadir al $PATH con syslink
sudo ln -s "$(pwd)/find_command.sh" /usr/local/bin/find_command

# O también puedes agregarlo como alias al archivo .bash_aliases
findcommands='ruta/al/script'
```

---

## Uso

```bash
find_command [-k | -c] <término>
```

| Flag | Descripción |
|------|-------------|
|  -k  | Busca por título en el índice (ej: `"SSH"`, `"nmap"`) |
|  -c  | Busca apariciones en el documento |


### Ejemplos

```bash
# Buscar las notas del bloque "SSH"
find_commands -k ssh

# Buscar cualquier mención a "john" en el índice
find_commands -c john
```

---

## Formato del índice (`index.txt`)

El script espera que las notas estén organizadas por bloques separados por líneas de guiones (`---` o más):

```
----------------------------------------------------------------------------------

        "SSH" (Protocolo - Puerto 22)

1. Ya sabemos cómo entrar por el puerto 22 del protocolo SSH, sin embargo también hay una alternativa estando dentro de la máquina:

        ssh usuario@ip-de-la-máquina

2. Para ingresar con una clave rsa:

        ssh -i id_rsa user@IP

3. Para crackear una clave RSA:

        ssh2john file_rsa > rsa.hash

        luego:

        john --wordlist=/path/to/rockyou > rsa.cracked

----------------------------------------------------------------------------------
```


---

## Estructura del proyecto:

```
find_commands/
├── find_commands.sh    # Script principal
└── index.txt           # Índice personal de comandos (ejemplo)
```

### Recomendaciones

Si deseas agregar más bloques:

- Intenta utilizar sólo comillas dobles (`"`) para los títulos, el resto puedes usar comillas simples (`'`)
- El espacio antes del título del bloque puede hacerse con un tabulado

- IMPORTANTE: Siéntanse libres de usarla y modificarla a su gusto

---

## Contexto

Soy aprendíz de ciberseguridad construyendo mi propio entorno desde cero. Este repositorio forma parte de mis herramientas de estudio y seguirá creciendo junto con mi aprendizaje.

**Plataformas donde practico:** TryHackMe, PicoCTF, OverTheWire, CTFLearn, PortSwigger

---

## Autor

**PFPE20** - Estudiante de ciberseguridad


