.class public Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ClickListener;
.super Ljava/lang/Object;
.implements Lorg/telegram/ui/Components/RecyclerListView$OnItemClickListener;

.field final synthetic this$0:Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;

.method public constructor <init>(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)V
    .locals 0
    iput-object p1, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ClickListener;->this$0:Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public onItemClick(Landroid/view/View;I)V
    .locals 4

    iget-object v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ClickListener;->this$0:Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;

    # Ghost Mode master toggle
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getGhostModeRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v1
    if-ne p2, v1, :cond_noread

    invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->toggleGhostMode()V
    # Refresh entire list
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getListAdapter(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;
    move-result-object v1
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
    return-void

    # No Read
    :cond_noread
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getNoReadRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v1
    if-ne p2, v1, :cond_noonline

    sget-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->sendReadPackets:Z
    xor-int/lit8 v1, v1, 0x1
    sput-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->sendReadPackets:Z
    const-string v2, "sendReadPackets"
    invoke-static {v2, v1}, Lcom/radolyn/ayugram/AyuConfig;->toggleSetting(Ljava/lang/String;Z)V
    instance-of v2, p1, Lorg/telegram/ui/Cells/j;
    if-eqz v2, :cond_noread_done
    check-cast p1, Lorg/telegram/ui/Cells/j;
    xor-int/lit8 v1, v1, 0x1
    invoke-virtual {p1, v1}, Lorg/telegram/ui/Cells/j;->setChecked(Z)V
    :cond_noread_done
    return-void

    # No Online
    :cond_noonline
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getNoOnlineRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v1
    if-ne p2, v1, :cond_notyping

    sget-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->sendOnlinePackets:Z
    xor-int/lit8 v1, v1, 0x1
    sput-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->sendOnlinePackets:Z
    const-string v2, "sendOnlinePackets"
    invoke-static {v2, v1}, Lcom/radolyn/ayugram/AyuConfig;->toggleSetting(Ljava/lang/String;Z)V
    instance-of v2, p1, Lorg/telegram/ui/Cells/j;
    if-eqz v2, :cond_noonline_done
    check-cast p1, Lorg/telegram/ui/Cells/j;
    xor-int/lit8 v1, v1, 0x1
    invoke-virtual {p1, v1}, Lorg/telegram/ui/Cells/j;->setChecked(Z)V
    :cond_noonline_done
    return-void

    # No Typing
    :cond_notyping
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getNoTypingRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v1
    if-ne p2, v1, :cond_noupload

    sget-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->sendTypingPackets:Z
    xor-int/lit8 v1, v1, 0x1
    sput-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->sendTypingPackets:Z
    const-string v2, "sendTypingPackets"
    invoke-static {v2, v1}, Lcom/radolyn/ayugram/AyuConfig;->toggleSetting(Ljava/lang/String;Z)V
    instance-of v2, p1, Lorg/telegram/ui/Cells/j;
    if-eqz v2, :cond_notyping_done
    check-cast p1, Lorg/telegram/ui/Cells/j;
    xor-int/lit8 v1, v1, 0x1
    invoke-virtual {p1, v1}, Lorg/telegram/ui/Cells/j;->setChecked(Z)V
    :cond_notyping_done
    return-void

    # No Upload
    :cond_noupload
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getNoUploadRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v1
    if-ne p2, v1, :cond_offline

    sget-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->sendUploadProgress:Z
    xor-int/lit8 v1, v1, 0x1
    sput-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->sendUploadProgress:Z
    const-string v2, "sendUploadProgress"
    invoke-static {v2, v1}, Lcom/radolyn/ayugram/AyuConfig;->toggleSetting(Ljava/lang/String;Z)V
    instance-of v2, p1, Lorg/telegram/ui/Cells/j;
    if-eqz v2, :cond_noupload_done
    check-cast p1, Lorg/telegram/ui/Cells/j;
    xor-int/lit8 v1, v1, 0x1
    invoke-virtual {p1, v1}, Lorg/telegram/ui/Cells/j;->setChecked(Z)V
    :cond_noupload_done
    return-void

    # Offline After Online
    :cond_offline
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getOfflineAfterOnlineRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v1
    if-ne p2, v1, :cond_markread

    sget-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->sendOfflinePacketAfterOnline:Z
    xor-int/lit8 v1, v1, 0x1
    sput-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->sendOfflinePacketAfterOnline:Z
    const-string v2, "sendOfflinePacketAfterOnline"
    invoke-static {v2, v1}, Lcom/radolyn/ayugram/AyuConfig;->toggleSetting(Ljava/lang/String;Z)V
    instance-of v2, p1, Lorg/telegram/ui/Cells/j;
    if-eqz v2, :cond_offline_done
    check-cast p1, Lorg/telegram/ui/Cells/j;
    invoke-virtual {p1, v1}, Lorg/telegram/ui/Cells/j;->setChecked(Z)V
    :cond_offline_done
    return-void

    # Mark Read After Send
    :cond_markread
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getMarkReadAfterSendRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v1
    if-ne p2, v1, :cond_alert

    sget-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->markReadAfterSend:Z
    xor-int/lit8 v1, v1, 0x1
    sput-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->markReadAfterSend:Z
    const-string v2, "markReadAfterSend"
    invoke-static {v2, v1}, Lcom/radolyn/ayugram/AyuConfig;->toggleSetting(Ljava/lang/String;Z)V
    instance-of v2, p1, Lorg/telegram/ui/Cells/j;
    if-eqz v2, :cond_markread_done
    check-cast p1, Lorg/telegram/ui/Cells/j;
    invoke-virtual {p1, v1}, Lorg/telegram/ui/Cells/j;->setChecked(Z)V
    :cond_markread_done
    return-void

    # Ghost Alert Stories
    :cond_alert
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getGhostAlertStoriesRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v1
    if-ne p2, v1, :cond_end

    sget-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->ghostModeAlertStories:Z
    xor-int/lit8 v1, v1, 0x1
    sput-boolean v1, Lcom/radolyn/ayugram/AyuConfig;->ghostModeAlertStories:Z
    const-string v2, "ghostModeAlertStories"
    invoke-static {v2, v1}, Lcom/radolyn/ayugram/AyuConfig;->toggleSetting(Ljava/lang/String;Z)V
    instance-of v2, p1, Lorg/telegram/ui/Cells/j;
    if-eqz v2, :cond_end
    check-cast p1, Lorg/telegram/ui/Cells/j;
    invoke-virtual {p1, v1}, Lorg/telegram/ui/Cells/j;->setChecked(Z)V

    :cond_end
    return-void
.end method
