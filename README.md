![image](https://tagui.readthedocs.io/en/latest/_images/tagui-logo.png)

# Installation

Before executing the next step, be sure to download **TagUI vx.xyz for Windows** file from [Tagui installation](https://tagui.readthedocs.io/en/latest/setup.html) and locate them inside "Installation" folder. In this folder there's a **Google Chrome** installer in case it's not currently installed in your system, **tagui** use it by default.

Use **TagUI_Install.ps1** powershell script to install tagui in your Windows O.S . Currently, tagui installer it's intended to work on **Windows O.S** for now. A **Linux** installer is under development.

```powershell
.\TagUI_Install.ps1
```

# Usage

Please refer to tagui doc for more info about [run options](https://tagui.readthedocs.io/en/latest/reference.html#run-options).

## Sonarqube demo
### Dependencies

* [Docker Engine](https://docs.docker.com/engine/)
* [Docker Compose](https://docs.docker.com/compose/install/)

![image](https://jhymer.dev/content/images/2020/05/docker-compose-1.png)

### Execution steps

1. Navigate to **Sonarqube** folder located inside **Demo**.
2. Execute the following command to lift up resources needed to run your Sonarqube container on port **9000** (this can be changed by altering **docker-compose.yml**.
```bash
docker compose up
```
3. All variables used during tagui execution are stored in **tagui_local.csv** file. If Sonarqube port is changed or you want to perform any modification, please refer to this file.
4. Execute the following command to run the automated UI flow. It will login into Sonarqube server for the first time and it will assign a **new password** for later purposes.
```bash
tagui first_login_sonar.tag
```

5. Execute the following command to login into Sonarqube server with the new password assigned previously and it will also generate and save into a .txt file a **Global Analysis Token** for project scanning purposes.
```bash
tagui generate_token_sonar.tag
```
6. When you're done, execute the following command to terminate all running processes lifted up by **docker compose**.
```bash
docker compose down --volumes --rmi all
```

## Ubuntu WSL demo
* [install Linux on Windows with WSL](https://learn.microsoft.com/en-us/windows/wsl/install)
* [Install Ubuntu on WSL2 on Windows 10
](https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-10#1-overview)

![image](https://miro.medium.com/v2/resize:fit:1000/0*AQWATr3nj-H4Dao2.png)

### Execution steps

1. Navigate to **Ubuntu_WSL** folder located inside **Demo**.
2. Execute the following command to update and upgrade your **WSL** packages using apt tool. Remember to type your **WSL** password inside **tagui_local.csv**.
```bash
tagui update_upgrade.tag -nobrowser
```
3. Execute the following command to start docker service inside **WSL** and checking its status. Remember to type your **WSL** password inside **tagui_local.csv**.
```bash
tagui start_docker_service.tag -nobrowser
```
4. If you want to orchestrate the previous two tasks by running just one command, execute the following command. Remember to type your **WSL** password inside **tagui_local.csv**.
```bash
tagui daily_tasks.tag -nobrowser
```

# Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

# License

[MIT](https://choosealicense.com/licenses/mit/)
