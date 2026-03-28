.class public Lcom/radolyn/ayugram/AyuConfig;
.super Ljava/lang/Object;

# static fields
.field public static preferences:Landroid/content/SharedPreferences;
.field public static editor:Landroid/content/SharedPreferences$Editor;

# Ghost Mode
.field public static sendReadPackets:Z
.field public static sendOnlinePackets:Z
.field public static sendOfflinePacketAfterOnline:Z
.field public static sendUploadProgress:Z
.field public static sendTypingPackets:Z
.field public static markReadAfterSend:Z

# Spy Mode
.field public static saveDeletedMessages:Z
.field public static saveMessagesHistory:Z
.field public static saveForBots:Z

# Features
.field public static showGhostToggleInDrawer:Z
.field public static ghostModeAlertStories:Z
.field public static scheduleMessages:Z
.field public static sendWithoutSound:I

# Customization
.field public static showDeletedMark:Z
.field public static showEditedMark:Z
.field public static deletedMarkText:Ljava/lang/String;

# State
.field private static configLoaded:Z
.field private static final sync:Ljava/lang/Object;

.method static constructor <clinit>()V
    .locals 1
    new-instance v0, Ljava/lang/Object;
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/radolyn/ayugram/AyuConfig;->sync:Ljava/lang/Object;
    return-void
.end method

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static ensureLoaded()V
    .locals 0
    invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->loadConfig()V
    return-void
.end method

.method public static loadConfig()V
    .locals 4

    sget-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->configLoaded:Z
    if-eqz v1, :cond_load
    return-void

    :cond_load
    sget-object v1, Lorg/telegram/messenger/cOM4;->b:Landroid/content/Context;
    if-nez v1, :cond_ctx_ok

    # Fallback defaults
    const/4 v0, 0x0
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendReadPackets:Z
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendOnlinePackets:Z
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendUploadProgress:Z
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendTypingPackets:Z
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->scheduleMessages:Z
    const/4 v0, 0x1
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendOfflinePacketAfterOnline:Z
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->saveDeletedMessages:Z
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->saveMessagesHistory:Z
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->markReadAfterSend:Z
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->saveForBots:Z
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->showGhostToggleInDrawer:Z
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->ghostModeAlertStories:Z
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->showDeletedMark:Z
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->showEditedMark:Z
    const/4 v0, 0x0
    sput v0, Lcom/radolyn/ayugram/AyuConfig;->sendWithoutSound:I
    const-string v0, "\ud83d\uddd1"
    sput-object v0, Lcom/radolyn/ayugram/AyuConfig;->deletedMarkText:Ljava/lang/String;
    return-void

    :cond_ctx_ok
    const-string v2, "ayugram_config"
    const/4 v3, 0x0
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v1
    sput-object v1, Lcom/radolyn/ayugram/AyuConfig;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v2
    sput-object v2, Lcom/radolyn/ayugram/AyuConfig;->editor:Landroid/content/SharedPreferences$Editor;

    # Ghost Mode defaults: ghost ON
    const-string v2, "sendReadPackets"
    const/4 v3, 0x0
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    sput-boolean v2, Lcom/radolyn/ayugram/AyuConfig;->sendReadPackets:Z

    const-string v2, "sendOnlinePackets"
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    sput-boolean v2, Lcom/radolyn/ayugram/AyuConfig;->sendOnlinePackets:Z

    const-string v2, "sendUploadProgress"
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    sput-boolean v2, Lcom/radolyn/ayugram/AyuConfig;->sendUploadProgress:Z

    const-string v2, "sendTypingPackets"
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    sput-boolean v2, Lcom/radolyn/ayugram/AyuConfig;->sendTypingPackets:Z

    const-string v2, "scheduleMessages"
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    sput-boolean v2, Lcom/radolyn/ayugram/AyuConfig;->scheduleMessages:Z

    const-string v2, "sendOfflinePacketAfterOnline"
    const/4 v3, 0x1
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    sput-boolean v2, Lcom/radolyn/ayugram/AyuConfig;->sendOfflinePacketAfterOnline:Z

    # Spy Mode defaults: all ON
    const-string v2, "saveDeletedMessages"
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    sput-boolean v2, Lcom/radolyn/ayugram/AyuConfig;->saveDeletedMessages:Z

    const-string v2, "saveMessagesHistory"
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    sput-boolean v2, Lcom/radolyn/ayugram/AyuConfig;->saveMessagesHistory:Z

    const-string v2, "markReadAfterSend"
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    sput-boolean v2, Lcom/radolyn/ayugram/AyuConfig;->markReadAfterSend:Z

    const-string v2, "saveForBots"
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    sput-boolean v2, Lcom/radolyn/ayugram/AyuConfig;->saveForBots:Z

    const-string v2, "showGhostToggleInDrawer"
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    sput-boolean v2, Lcom/radolyn/ayugram/AyuConfig;->showGhostToggleInDrawer:Z

    const-string v2, "ghostModeAlertStories"
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    sput-boolean v2, Lcom/radolyn/ayugram/AyuConfig;->ghostModeAlertStories:Z

    const-string v2, "showDeletedMark"
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    sput-boolean v2, Lcom/radolyn/ayugram/AyuConfig;->showDeletedMark:Z

    const-string v2, "showEditedMark"
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v2
    sput-boolean v2, Lcom/radolyn/ayugram/AyuConfig;->showEditedMark:Z

    const-string v2, "sendWithoutSound"
    const/4 v3, 0x0
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    move-result v2
    sput v2, Lcom/radolyn/ayugram/AyuConfig;->sendWithoutSound:I

    const-string v2, "deletedMarkText"
    const-string v3, "\ud83d\uddd1"
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    sput-object v2, Lcom/radolyn/ayugram/AyuConfig;->deletedMarkText:Ljava/lang/String;

    const/4 v0, 0x1
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->configLoaded:Z
    return-void
.end method

.method public static isGhostModeActive()Z
    .locals 2

    invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->ensureLoaded()V

    sget-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendReadPackets:Z
    if-nez v0, :cond_not_ghost

    sget-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendOnlinePackets:Z
    if-nez v0, :cond_not_ghost

    sget-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendUploadProgress:Z
    if-nez v0, :cond_not_ghost

    sget-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendTypingPackets:Z
    if-nez v0, :cond_not_ghost

    sget-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendOfflinePacketAfterOnline:Z
    if-eqz v0, :cond_not_ghost

    const/4 v1, 0x1
    return v1

    :cond_not_ghost
    const/4 v1, 0x0
    return v1
.end method

.method public static getGhostModeCount()I
    .locals 2

    invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->ensureLoaded()V
    const/4 v0, 0x0

    sget-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->sendReadPackets:Z
    if-nez v1, :cond_1
    add-int/lit8 v0, v0, 0x1
    :cond_1

    sget-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->sendOnlinePackets:Z
    if-nez v1, :cond_2
    add-int/lit8 v0, v0, 0x1
    :cond_2

    sget-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->sendTypingPackets:Z
    if-nez v1, :cond_3
    add-int/lit8 v0, v0, 0x1
    :cond_3

    sget-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->sendUploadProgress:Z
    if-nez v1, :cond_4
    add-int/lit8 v0, v0, 0x1
    :cond_4

    sget-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->sendOfflinePacketAfterOnline:Z
    if-eqz v1, :cond_5
    add-int/lit8 v0, v0, 0x1
    :cond_5

    return v0
.end method

.method public static setGhostMode(Z)V
    .locals 3

    invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->ensureLoaded()V

    xor-int/lit8 v0, p0, 0x1
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendReadPackets:Z
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendOnlinePackets:Z
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendUploadProgress:Z
    sput-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendTypingPackets:Z
    sput-boolean p0, Lcom/radolyn/ayugram/AyuConfig;->sendOfflinePacketAfterOnline:Z

    sget-object v1, Lcom/radolyn/ayugram/AyuConfig;->editor:Landroid/content/SharedPreferences$Editor;
    if-eqz v1, :cond_no_editor

    const-string v2, "sendReadPackets"
    sget-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendReadPackets:Z
    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    const-string v2, "sendOnlinePackets"
    sget-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendOnlinePackets:Z
    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    const-string v2, "sendUploadProgress"
    sget-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendUploadProgress:Z
    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    const-string v2, "sendTypingPackets"
    sget-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendTypingPackets:Z
    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    const-string v2, "sendOfflinePacketAfterOnline"
    sget-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendOfflinePacketAfterOnline:Z
    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_no_editor
    return-void
.end method

.method public static toggleGhostMode()V
    .locals 1
    invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->isGhostModeActive()Z
    move-result v0
    xor-int/lit8 v0, v0, 0x1
    invoke-static {v0}, Lcom/radolyn/ayugram/AyuConfig;->setGhostMode(Z)V
    return-void
.end method

.method public static isAntiDeleteActive()Z
    .locals 1
    invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->ensureLoaded()V
    sget-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->saveDeletedMessages:Z
    return v0
.end method

.method public static toggleSetting(Ljava/lang/String;Z)V
    .locals 2
    invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->ensureLoaded()V
    sget-object v0, Lcom/radolyn/ayugram/AyuConfig;->editor:Landroid/content/SharedPreferences$Editor;
    if-eqz v0, :cond_end
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :cond_end
    return-void
.end method

.method public static setBooleanSetting(Ljava/lang/String;Z)V
    .locals 1
    invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->ensureLoaded()V
    sget-object v0, Lcom/radolyn/ayugram/AyuConfig;->editor:Landroid/content/SharedPreferences$Editor;
    if-eqz v0, :cond_end
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :cond_end
    return-void
.end method

.method public static setIntSetting(Ljava/lang/String;I)V
    .locals 1
    invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->ensureLoaded()V
    sget-object v0, Lcom/radolyn/ayugram/AyuConfig;->editor:Landroid/content/SharedPreferences$Editor;
    if-eqz v0, :cond_end
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :cond_end
    return-void
.end method
