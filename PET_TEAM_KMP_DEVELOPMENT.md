# Pet Team KMP Development Plan

## 1. Product Summary

這是一個給讀書、coding、CTF、健身新手等小隊使用的共養型進度 app。

核心一句話：

> 朋友一起養一隻靠努力長大的寵物。

使用者每天完成自己的任務，會把 EXP 貢獻給共同寵物。小隊可以看到彼此的完成紀錄、每週貢獻榜、寵物等級與狀態。第一版的重點不是大型社群，而是 2-5 個朋友之間的低壓力陪伴與輕競爭。

## 2. Target Users

主要族群：

- CTF / coding / LeetCode 小隊
- 考試讀書小隊
- 健身新手朋友群
- 想養成習慣，但討厭一般 productivity app 的人

第一版建議先鎖定：

> CTF / coding / 讀書小隊

原因是任務型態清楚，使用者願意記錄進度，也容易接受 EXP、等級、稱號、戰績這種遊戲化設計。

## 3. Product Positioning

不是：

- 不是完整待辦 app
- 不是 Notion 替代品
- 不是健身教學平台
- 不是公開社群
- 不是聊天軟體
- 不是 AI 學習助理

而是：

- 小隊共養寵物
- 每日任務完成紀錄
- 輕量排行榜
- 朋友之間的進度陪伴
- 有遊戲感的習慣養成

## 4. Core Loop

1. 使用者加入或建立小隊。
2. 使用者建立自己的任務，例如「刷 LeetCode 2 題」、「讀 Security+ 30 分鐘」、「解 CTF web 題 1 題」。
3. 完成任務後打卡。
4. 個人獲得 EXP，小隊寵物也獲得 EXP。
5. 寵物升級、心情變好或解鎖外觀。
6. 每週結算貢獻榜與稱號。
7. 下週重新開始。

這個 loop 要在 10 秒內完成一次打卡，不能太重。

## 5. MVP Scope

第一版必做：

- 建立小隊
- 用邀請碼加入小隊
- 成員列表
- 建立個人任務
- 完成任務打卡
- 小隊寵物 EXP / 等級
- 寵物心情狀態
- 小隊活動紀錄
- 每週貢獻榜
- 每週稱號
- 本機快取
- iOS / Android 基本適配

第一版先不做：

- 聊天
- 公開社群
- 陌生人配對
- 複雜防作弊
- AI 任務建議
- 雲端附件
- 訂閱制
- 多隻寵物系統
- 寵物商城
- 完整成就系統

## 6. Suggested App Name Ideas

- TeamPet
- GrindPet
- QuestPet
- StudyPet
- PwnPet
- BugBuddy
- CoPet
- HatchLog
- PartyProgress

暫定內部代號：

> QuestPet

## 7. Main Screens

### 7.1 Home

用途：讓使用者一打開就知道今天小隊狀況。

內容：

- 小隊寵物
- 寵物等級與 EXP 條
- 寵物心情
- 今日自己的任務
- 快速打卡按鈕
- 今日小隊活動摘要

### 7.2 Tasks

用途：管理自己的任務。

內容：

- 任務列表
- 新增任務
- 任務分類
- EXP 權重
- 是否每日重複
- 完成狀態

任務分類第一版可以先固定：

- Study
- Coding
- CTF
- Fitness
- Custom

### 7.3 Squad

用途：看小隊與朋友狀態。

內容：

- 小隊名稱
- 邀請碼
- 成員列表
- 每個人的本週 EXP
- 每個人的連續天數
- 最近活動紀錄

### 7.4 Leaderboard

用途：輕競爭。

內容：

- 本週 EXP 排名
- 本週完成次數排名
- 連續天數
- 本週稱號

稱號例子：

- Weekly Carry
- Stable Grinder
- Last Minute Saver
- Boss Finisher
- Consistency King

中文 UI 可改成：

- 本週大腿
- 穩定輸出
- 最後救場
- 收尾高手
- 連勤王

### 7.5 Pet

用途：呈現養成感。

內容：

- 寵物目前等級
- 心情
- 解鎖外觀
- 小隊總貢獻
- 成長紀錄

第一版寵物狀態：

- Hungry: 小隊今天還沒有人打卡
- Calm: 有人完成任務
- Happy: 多人完成任務
- Energized: 小隊達到今日目標
- Sleepy: 深夜或低活動狀態

### 7.6 Settings

用途：基本帳號與 app 設定。

內容：

- 暱稱
- 頭像顏色
- 小隊管理
- 離開小隊
- 通知開關
- 隱私政策
- 刪除資料

## 8. KMP Architecture

建議第一版採用：

> Kotlin Multiplatform + Compose Multiplatform + Supabase

原因：

- iOS / Android UI 可共用，速度最快
- 商業邏輯放 shared module
- Supabase 對資料表、邀請碼、小隊、排行榜很直覺
- 第一版不用自己維護完整後端

專案模組建議：

```text
questpet/
  composeApp/
    src/
      commonMain/
      androidMain/
      iosMain/
  shared/
    src/
      commonMain/
        kotlin/
          domain/
          data/
          network/
          storage/
          presentation/
  iosApp/
  build.gradle.kts
  settings.gradle.kts
```

如果使用 Compose Multiplatform template，也可以讓 `composeApp/commonMain` 同時放 UI 與 shared logic。等功能變多再拆成獨立 `shared` module。

## 9. Shared Domain Model

### UserProfile

```kotlin
data class UserProfile(
    val id: String,
    val displayName: String,
    val avatarColor: String,
    val createdAt: Instant
)
```

### Squad

```kotlin
data class Squad(
    val id: String,
    val name: String,
    val inviteCode: String,
    val createdBy: String,
    val createdAt: Instant
)
```

### SquadMember

```kotlin
data class SquadMember(
    val squadId: String,
    val userId: String,
    val role: MemberRole,
    val joinedAt: Instant
)

enum class MemberRole {
    Owner,
    Member
}
```

### Task

```kotlin
data class Task(
    val id: String,
    val userId: String,
    val squadId: String,
    val title: String,
    val category: TaskCategory,
    val expValue: Int,
    val isRepeatingDaily: Boolean,
    val isArchived: Boolean,
    val createdAt: Instant
)

enum class TaskCategory {
    Study,
    Coding,
    Ctf,
    Fitness,
    Custom
}
```

### CheckIn

```kotlin
data class CheckIn(
    val id: String,
    val taskId: String,
    val userId: String,
    val squadId: String,
    val expEarned: Int,
    val note: String?,
    val createdAt: Instant
)
```

### PetState

```kotlin
data class PetState(
    val squadId: String,
    val level: Int,
    val currentExp: Int,
    val expToNextLevel: Int,
    val mood: PetMood,
    val updatedAt: Instant
)

enum class PetMood {
    Hungry,
    Calm,
    Happy,
    Energized,
    Sleepy
}
```

### WeeklyScore

```kotlin
data class WeeklyScore(
    val squadId: String,
    val userId: String,
    val weekStartDate: LocalDate,
    val totalExp: Int,
    val checkInCount: Int,
    val streakDays: Int
)
```

## 10. Supabase Tables

### profiles

```sql
create table profiles (
  id uuid primary key,
  display_name text not null,
  avatar_color text not null,
  created_at timestamptz not null default now()
);
```

### squads

```sql
create table squads (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  invite_code text not null unique,
  created_by uuid not null references profiles(id),
  created_at timestamptz not null default now()
);
```

### squad_members

```sql
create table squad_members (
  squad_id uuid not null references squads(id) on delete cascade,
  user_id uuid not null references profiles(id) on delete cascade,
  role text not null default 'member',
  joined_at timestamptz not null default now(),
  primary key (squad_id, user_id)
);
```

### tasks

```sql
create table tasks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references profiles(id) on delete cascade,
  squad_id uuid not null references squads(id) on delete cascade,
  title text not null,
  category text not null,
  exp_value int not null default 10,
  is_repeating_daily boolean not null default true,
  is_archived boolean not null default false,
  created_at timestamptz not null default now()
);
```

### checkins

```sql
create table checkins (
  id uuid primary key default gen_random_uuid(),
  task_id uuid not null references tasks(id) on delete cascade,
  user_id uuid not null references profiles(id) on delete cascade,
  squad_id uuid not null references squads(id) on delete cascade,
  exp_earned int not null,
  note text,
  created_at timestamptz not null default now()
);
```

### pets

```sql
create table pets (
  squad_id uuid primary key references squads(id) on delete cascade,
  level int not null default 1,
  current_exp int not null default 0,
  mood text not null default 'hungry',
  updated_at timestamptz not null default now()
);
```

## 11. EXP Rules

第一版用簡單規則就好：

- 一般任務：10 EXP
- 困難任務：20 EXP
- 每日第一次打卡：額外 5 EXP
- 小隊今日達標：全員額外 10 EXP
- 單一使用者每天最多貢獻 100 EXP

等級公式：

```text
expToNextLevel = 100 + (level - 1) * 50
```

例如：

- Lv. 1 -> Lv. 2: 100 EXP
- Lv. 2 -> Lv. 3: 150 EXP
- Lv. 3 -> Lv. 4: 200 EXP

第一版不要做太複雜的平衡。重點是讓使用者感覺每次打卡都有推進。

## 12. Competition Design

競爭要輕，不要讓人焦慮。

第一版只做小隊內排行榜：

- 本週 EXP
- 本週完成次數
- 連續天數

不要做全站排行榜。

排行榜每週一重置，但歷史週可以保留。週結算時發稱號：

- 最高 EXP：本週大腿
- 最多完成次數：穩定輸出
- 週末完成最多：最後救場
- 連續天數最高：連勤王

公平性原則：

- 比的是「完成自己設定的任務」
- 不比較任務本身難度的絕對價值
- 每天有 EXP 上限，避免亂刷
- 第一版相信朋友，不做嚴格防作弊

## 13. Offline And Sync

第一版可以做基本離線能力：

- 任務列表本機快取
- 打卡先寫本機 pending queue
- 有網路時同步 checkins
- 同步成功後更新 pet state

如果時間不足，第一版可以先要求網路連線才能打卡，但 UI 要清楚提示。

KMP 可用：

- SQLDelight: 本機資料
- Ktor Client: API request
- kotlinx.serialization: JSON
- kotlinx.datetime: 日期

## 14. Notifications

第一版通知保持簡單：

- 每日提醒
- 小隊有人打卡時提醒
- 每週結算提醒

通知文案例子：

- 今天還沒餵到小隊寵物
- Alex 完成了一個任務，小隊寵物升溫了
- 本週結算完成，你拿到了「穩定輸出」

## 15. Visual Direction

整體感覺：

- 可愛，但不要幼稚
- 像小隊儀表板，不像玩具
- 適合學生、工程師、CTF 玩家每天打開
- 高資訊密度，但不要壓迫

建議風格：

- 深色與淺色都支援
- 主色不要只用紫藍漸層
- 寵物區可以活潑
- 任務和排行榜區要清楚、好掃描
- 按鈕要大，打卡要快

第一版寵物可以先用簡單 2D 圖像或 Lottie animation。不要一開始做複雜骨骼動畫。

## 16. 12 Week Roadmap

### Week 1: Project Setup

- 建立 KMP 專案
- 設定 Android / iOS build
- 決定 Compose Multiplatform UI 架構
- 建立基本 navigation
- 建立 design tokens

完成標準：

- Android simulator 可跑
- iOS simulator 可跑
- 有空白 Home / Tasks / Squad / Leaderboard / Settings

### Week 2: Local Task MVP

- 建立 task model
- 新增任務
- 任務列表
- 完成任務
- 本機假資料 repository

完成標準：

- 不接後端也能建立與完成任務

### Week 3: EXP And Pet State

- EXP 計算
- 等級公式
- 寵物狀態
- Home 顯示寵物與 EXP 條
- 打卡後即時更新

完成標準：

- 使用者完成任務後，寵物 EXP / level / mood 會變

### Week 4: Supabase Integration

- 建立 Supabase project
- 建立資料表
- KMP API client
- profiles / squads / tasks / checkins API
- 基本錯誤處理

完成標準：

- 真實資料可從雲端讀寫

### Week 5: Squad And Invite Code

- 建立小隊
- 產生邀請碼
- 用邀請碼加入小隊
- 成員列表
- 小隊寵物初始化

完成標準：

- 兩台裝置可以加入同一個小隊

### Week 6: Activity Feed

- 小隊活動紀錄
- 新 checkin 顯示在 feed
- Home 顯示最近活動
- 重新整理資料

完成標準：

- A 打卡後，B 能看到活動紀錄

### Week 7: Weekly Leaderboard

- 本週 EXP 計算
- 完成次數
- 連續天數
- 小隊內排名
- 稱號邏輯

完成標準：

- 小隊可以看到本週排行榜與稱號

### Week 8: Pet Polish

- 寵物視覺
- 心情變化
- 升級回饋
- 完成任務動畫
- 空狀態

完成標準：

- app 已經有明確記憶點，而不是普通任務列表

### Week 9: Offline Cache And Stability

- 本機快取
- loading / error state
- 網路錯誤處理
- pending checkin sync
- crash 檢查

完成標準：

- 弱網路下不會讓使用者覺得資料壞掉

### Week 10: Notifications And Settings

- 每日提醒
- 小隊打卡提醒
- 暱稱設定
- 通知設定
- 離開小隊
- 刪除資料入口

完成標準：

- 基本產品閉環完整

### Week 11: Store Preparation

- app icon
- launch screen
- App Store screenshots
- Google Play screenshots
- 隱私政策頁面
- 測試帳號或 reviewer notes
- 版本號與 build 設定

完成標準：

- 可以送 TestFlight / internal testing

### Week 12: Beta And Submission

- TestFlight 測試
- Android internal testing
- 修主要 bug
- 檢查崩潰與資料刪除流程
- 送審

完成標準：

- iOS / Android 都有可送審 build

## 17. Launch Criteria

送審前必須符合：

- 新使用者可以建立 profile
- 使用者可以建立小隊
- 使用者可以邀請朋友加入
- 使用者可以建立與完成任務
- 小隊寵物會因打卡成長
- 排行榜資料正確
- 沒有 placeholder UI
- 沒有明顯 crash
- 有隱私政策
- 有資料刪除或帳號刪除入口
- store screenshots 能清楚展示核心玩法

## 18. Risk List

### Risk: Scope Creep

最危險的是一開始就想做聊天、商城、AI、公開社群。

處理方式：

- 第一版只做小隊共養與每週榜
- 所有社交都限制在邀請碼小隊內

### Risk: KMP iOS Polish

Compose Multiplatform 在 iOS 上需要特別注意滑動、鍵盤、safe area、字體與觸控感。

處理方式：

- 每週都跑 iOS simulator
- 不要等最後才測 iOS

### Risk: Backend Rules

多人小隊需要基本權限，否則可能讀到別人的資料。

處理方式：

- Supabase RLS 從一開始就設計
- 每個 query 都以 squad membership 為界線

### Risk: Motivation Drops

如果只有打卡，使用者很快膩。

處理方式：

- 寵物升級要有明顯回饋
- 每週稱號要有趣
- 活動 feed 要讓朋友存在感變強

## 19. First Build Checklist

- 建立 KMP project
- 跑起 Android
- 跑起 iOS
- 建立 navigation
- 建立 theme
- 建立 fake repository
- 做 Home UI
- 做 Task UI
- 做打卡
- 做 EXP 計算
- 做 PetState

第一個 milestone 目標：

> 單機版可以建立任務、打卡、讓寵物升級。

這個完成後，再接小隊與 Supabase。

## 20. Product Principle

每個功能都要符合這句話：

> 讓朋友的努力被看見，讓自己的進度有一個可愛但不幼稚的回饋。

如果某個功能不幫助這件事，第一版先不要做。
