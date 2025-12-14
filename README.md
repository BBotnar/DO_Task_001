1. Go to https://github.com

1.1 Click 'New repository'
1.2 Enter name, check Private
1.3 Press Create repository

2. Download any IDE redactor, i will be use and showing in Visual Studio Code 
2.1 Install Git from https://git-scm.com/

3. Connect your project from Github with VS Code
Press combination Ctrl + Shift + P
Choose 'Git:Clone'
Select Clone from GitHub
![alt text](image-2.png)
Choose repository, Choose folder on your PC
Click Open repository
VS Code is now connected to GitHub

For verify, open terminal git: 'Ctrl + `'
Put 'git remote -v'
If you see like 'origin  https://github.com/<your-username>/DevOps-TaskName.git' - You connected

If error like 'fatal: not a git repository (or any of the parent directories): .git' - You should open your project from your Project Directory (File -> Open Folder -> Choose your folder for git)

4. Create `.gitignore` file.
.gitignore is a file that tells Git which files NOT to upload.

4.1 Creating '.gitignore' file:

In VS Code Explorer panel:
File -> New File

Name it exactly:
'.gitignore'

Add content to .gitignore

I use settings like this:


# VS Code settings
.vscode/

# Logs
*.log

# Temporary files
*.tmp
*.swp

5. Create branch