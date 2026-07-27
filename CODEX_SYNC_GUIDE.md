# CyberAtlas 兩台電腦與 Codex 同步教學

這份文件教你把 `CyberAtlas` 專案放到 GitHub，並在「家裡桌機」和「外出電腦」之間接力開發。

目標不是複製整個 `~/.codex/`，而是讓兩台電腦都能透過同一份 repo、同一份 Codex 專案規則、同一個 ChatGPT/Codex 帳號，穩定接續工作。

## 同步哪些東西

應該同步到 GitHub：

- 專案程式碼
- `README.md`
- `PRODUCT_SPEC.md`
- `KMP_DEVELOPMENT.md`
- `CONTENT_MAP.md`
- `CODEX_SYNC_GUIDE.md`
- `AGENTS.md`

不要同步到 GitHub：

- `~/.codex/`
- API keys
- 登入 token
- 本機 build output
- Xcode DerivedData
- Android Studio / IntelliJ 的個人設定

## 第一次：在外出電腦建立 GitHub 同步

目前這台電腦的專案路徑是：

```sh
/Users/yin0616/Documents/swift
```

進入專案：

```sh
cd /Users/yin0616/Documents/swift
```

確認 Git 狀態：

```sh
git status
```

如果還沒有第一次 commit，先建立 commit：

```sh
git add .
git commit -m "Initial CyberAtlas project setup"
```

到 GitHub 建一個新的 repository，建議名稱：

```text
CyberAtlas
```

建 repo 時建議：

- Visibility: Private 或 Public 都可以，還沒完成前建議 Private。
- 不要勾 Add README。
- 不要勾 Add .gitignore。
- 不要勾 Add license。

GitHub 建好後，回到終端機接 remote：

```sh
git remote add origin https://github.com/yin0616/cyberatlas.git
git branch -M main
git push -u origin main
```

這個專案目前使用的 GitHub repository 是：

```text
https://github.com/yin0616/cyberatlas
```

## 第二次：在 Windows 家裡桌機 clone 專案

家裡桌機先安裝：

- Git
- ChatGPT Desktop 或 Codex CLI
- Android Studio 或 IntelliJ IDEA

Windows 不能直接 build iOS app，iOS 實機或模擬器仍然需要 Mac + Xcode。Windows 桌機可以先負責 Android、KMP shared code、文件、內容資料與大部分 Compose UI。

建議在 Windows 放這裡：

```text
C:\Users\你的使用者名稱\Projects\CyberAtlas
```

用 PowerShell 或 Windows Terminal 執行：

```powershell
mkdir $HOME\Projects
cd $HOME\Projects
```

clone 專案：

```powershell
git clone https://github.com/yin0616/cyberatlas.git CyberAtlas
cd CyberAtlas
```

確認內容有下來：

```powershell
ls
git status
```

然後：

- Android Studio 選 **Open**，打開 `C:\Users\你的使用者名稱\Projects\CyberAtlas`。
- ChatGPT Desktop / Codex 新增 local project，也選同一個 `CyberAtlas` 資料夾。

不要只開 `androidApp`，要開有 `settings.gradle.kts`、`AGENTS.md` 的 repo 根目錄。

## 每次開始寫之前

不管你在家裡桌機或外出電腦，開始寫之前先拉最新版本：

```sh
cd 專案路徑
git pull
```

例如外出電腦：

```sh
cd /Users/yin0616/Documents/swift
git pull
```

例如家裡桌機：

```powershell
cd $HOME\Projects\CyberAtlas
git pull
```

## 每次寫完之後

先看改了什麼：

```sh
git status
```

確認沒問題後 commit：

```sh
git add .
git commit -m "Describe the change"
```

把 `Describe the change` 換成這次做的事，例如：

```sh
git commit -m "Rename project to CyberAtlas"
```

推到 GitHub：

```sh
git push
```

## 建議工作節奏

在家裡桌機寫：

```powershell
cd $HOME\Projects\CyberAtlas
git pull
# 開發
git add .
git commit -m "Add concept card detail screen"
git push
```

出門後在外出電腦接著寫：

```sh
git pull
# 開發
git add .
git commit -m "Add sample cybersecurity content"
git push
```

回家後桌機再接：

```powershell
cd $HOME\Projects\CyberAtlas
git pull
```

## Codex 要怎麼一起接力

Codex 的同步分成兩層：

1. 專案規則：靠 `AGENTS.md`
2. 同一個工作 task：靠 ChatGPT/Codex 同帳號、Remote 或 Handoff

`AGENTS.md` 已經放在 repo 根目錄。兩台電腦只要 clone 同一個 repo，Codex 就能讀到同一套專案規則。

如果你只是要在兩台電腦輪流開新 task，做到這樣就夠：

- 兩台都 clone 同一個 GitHub repo。
- 兩台都登入同一個 ChatGPT/Codex 帳號。
- 兩台都把 repo 加進 Codex local project。
- 每次開始前 `git pull`，寫完後 `git push`。

如果你想接同一個 Codex task，使用 ChatGPT Desktop 的 Remote / Handoff：

- 兩台電腦都安裝並登入 ChatGPT Desktop。
- 兩台電腦都 clone 同一個 GitHub repo。
- 兩台電腦都在 Codex 裡儲存同一個 repo 的 local project。
- 在桌面版 Codex 的 task footer 選目前執行位置，將 task handoff 到另一台電腦。

Handoff 比較適合你做到一半，想把同一段 Codex 對話和 Git 狀態移到另一台主機繼續。

## 家裡桌機當主要 Codex Host

如果你希望外出時也像在操作家裡那台 Codex，可以把家裡桌機當 host：

1. 家裡桌機開 ChatGPT Desktop。
2. 開啟 Remote / Connections。
3. 讓家裡桌機保持開機、連網、不要睡眠。
4. 外出電腦或手機透過 Remote 連回家裡桌機。

這種模式下，實際跑指令、讀檔、使用 credentials 的是家裡桌機。

優點：

- 最像同一個 Codex 環境。
- 工具、登入狀態、專案、plugins 都在同一台 host。

缺點：

- 家裡桌機要一直能連。
- 網路或睡眠會中斷。

## 遇到衝突怎麼辦

如果兩台電腦都改到同一個檔案，`git pull` 可能出現 conflict。

先看狀態：

```sh
git status
```

打開衝突檔，會看到類似：

```text
<<<<<<< HEAD
你這台電腦的版本
=======
GitHub 上的新版本
>>>>>>> branch
```

保留正確內容後，再執行：

```sh
git add .
git commit -m "Resolve merge conflict"
git push
```

如果不確定怎麼處理，不要亂刪，直接問 Codex 幫你看 conflict。

## 最推薦的日常模式

平常用這個：

```text
GitHub + AGENTS.md + git pull / commit / push
```

需要接同一個 Codex task 時才用：

```text
Remote / Handoff
```

這樣最穩，也最不容易把本機登入資料或 Codex 私人設定搞亂。
