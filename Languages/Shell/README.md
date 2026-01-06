<div align="center">
    <img alt="logo" width="110" src="https://raw.githubusercontent.com/FJrodafo/University/main/Languages/Shell/Assets/Logo.png" />
</div>

## Getting Started

Open your repository folder and type the following commands to create your first script:

```shell
cd Documents
mkdir Scripts
cd Scripts
touch Tutorial.sh
```

Let's write some commands inside the script file using your favorite text editor:

```shell
#!/bin/bash

# Who are you?
echo "$USER"

# Where are you?
echo "$PWD"

# Where is your home?
echo "$HOME"

# What is your default shell?
echo "$SHELL"
```

Once your first script is created, you have to give it execution permissions by typing the following command:

```shell
chmod +x Tutorial.sh
```

Now all that remains is to run the script. To do this you have to open a terminal in the place where the script is located and execute the following command:

```shell
./Tutorial.sh
```

This is all you need to know to start writing your scripts!