.class public Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;

.field final synthetic this$0:Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;
.field private mContext:Landroid/content/Context;

.method public constructor <init>(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;Landroid/content/Context;)V
    .locals 0
    iput-object p1, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;->this$0:Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;
    iput-object p2, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;->mContext:Landroid/content/Context;
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V
    return-void
.end method

.method public getItemCount()I
    .locals 1
    iget-object v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;->this$0:Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getRowCount(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v0
    return v0
.end method

.method public getItemViewType(I)I
    .locals 2
    iget-object v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;->this$0:Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;

    # Header rows -> 0
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getHeaderRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v1
    if-eq p1, v1, :type_header
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getFeaturesHeaderRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v1
    if-eq p1, v1, :type_header

    # Shadow rows -> 1
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getGhostShadowRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v1
    if-eq p1, v1, :type_shadow
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getFeaturesShadowRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v1
    if-eq p1, v1, :type_shadow

    # Ghost mode master toggle -> 3 (TextCheckCell with special handling)
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getGhostModeRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v1
    if-eq p1, v1, :type_check

    # All other rows -> 2 (TextCheckCell)
    const/4 v1, 0x2
    return v1

    :type_header
    const/4 v1, 0x0
    return v1

    :type_shadow
    const/4 v1, 0x1
    return v1

    :type_check
    const/4 v1, 0x2
    return v1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 3

    iget-object v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;->mContext:Landroid/content/Context;

    packed-switch p2, :pswitch_data_0

    # default - TextCheckCell
    :pswitch_default
    new-instance v1, Lorg/telegram/ui/Cells/j;
    invoke-direct {v1, v0}, Lorg/telegram/ui/Cells/j;-><init>(Landroid/content/Context;)V
    sget v2, Lorg/telegram/ui/ActionBar/q;->d7:I
    invoke-static {v2}, Lorg/telegram/ui/ActionBar/q;->u2(I)I
    move-result v2
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V
    goto :goto_wrap

    :pswitch_0
    # type 0 - HeaderCell
    new-instance v1, Lorg/telegram/ui/Cells/g1;
    invoke-direct {v1, v0}, Lorg/telegram/ui/Cells/g1;-><init>(Landroid/content/Context;)V
    sget v2, Lorg/telegram/ui/ActionBar/q;->d7:I
    invoke-static {v2}, Lorg/telegram/ui/ActionBar/q;->u2(I)I
    move-result v2
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V
    goto :goto_wrap

    :pswitch_1
    # type 1 - ShadowSection
    new-instance v1, Lorg/telegram/ui/Cells/h1;
    invoke-direct {v1, v0}, Lorg/telegram/ui/Cells/h1;-><init>(Landroid/content/Context;)V
    sget v2, Lorg/telegram/messenger/R$drawable;->greydivider:I
    sget v0, Lorg/telegram/ui/ActionBar/q;->a8:I
    iget-object p2, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;->mContext:Landroid/content/Context;
    invoke-static {p2, v2, v0}, Lorg/telegram/ui/ActionBar/q;->E3(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;
    move-result-object v2
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    goto :goto_wrap

    :goto_wrap
    new-instance p2, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    const/4 v0, -0x1
    const/4 v2, -0x2
    invoke-direct {p2, v0, v2}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V
    invoke-virtual {v1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p2, Lorg/telegram/ui/Components/RecyclerListView$Holder;
    invoke-direct {p2, v1}, Lorg/telegram/ui/Components/RecyclerListView$Holder;-><init>(Landroid/view/View;)V
    return-object p2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 8

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getItemViewType()I
    move-result v0

    iget-object v1, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;->this$0:Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;

    # type 0 = HeaderCell
    if-nez v0, :cond_not_header
    iget-object v3, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;
    check-cast v3, Lorg/telegram/ui/Cells/g1;

    invoke-static {v1}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getHeaderRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v0
    if-ne p2, v0, :cond_feat_header
    const-string v0, "Fun\u00e7\u00f5es"
    invoke-virtual {v3, v0}, Lorg/telegram/ui/Cells/g1;->setText(Ljava/lang/String;)V
    return-void
    :cond_feat_header
    const-string v0, "Recursos"
    invoke-virtual {v3, v0}, Lorg/telegram/ui/Cells/g1;->setText(Ljava/lang/String;)V
    return-void

    :cond_not_header
    const/4 v2, 0x1
    if-ne v0, v2, :cond_not_shadow
    return-void

    :cond_not_shadow
    # TextCheckCell
    iget-object v3, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;
    check-cast v3, Lorg/telegram/ui/Cells/j;

    const/4 v4, 0x0
    const/4 v5, 0x0
    const/4 v6, 0x1
    const/4 v7, 0x0

    # ghostModeRow
    invoke-static {v1}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getGhostModeRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v0
    if-ne p2, v0, :cond_noread

    invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->getGhostModeCount()I
    move-result v4
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V
    const-string v6, "Modo Fantasma  "
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v6, "/5"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5

    invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->isGhostModeActive()Z
    move-result v6
    const/4 v7, 0x1
    const-string v4, ""
    invoke-virtual {v3, v5, v4, v6, v7, v6, v7}, Lorg/telegram/ui/Cells/j;->d(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZIZZ)V
    return-void

    # noReadRow
    :cond_noread
    invoke-static {v1}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getNoReadRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v0
    if-ne p2, v0, :cond_noonline
    const-string v5, "N\u00e3o visualizar mensagens"
    sget-boolean v6, Lcom/radolyn/ayugram/AyuConfig;->sendReadPackets:Z
    xor-int/lit8 v6, v6, 0x1
    const-string v4, ""
    invoke-virtual {v3, v5, v4, v6, v7, v6, v7}, Lorg/telegram/ui/Cells/j;->d(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZIZZ)V
    return-void

    # noOnlineRow
    :cond_noonline
    invoke-static {v1}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getNoOnlineRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v0
    if-ne p2, v0, :cond_notyping
    const-string v5, "Ocultar Online"
    sget-boolean v6, Lcom/radolyn/ayugram/AyuConfig;->sendOnlinePackets:Z
    xor-int/lit8 v6, v6, 0x1
    const-string v4, ""
    invoke-virtual {v3, v5, v4, v6, v7, v6, v7}, Lorg/telegram/ui/Cells/j;->d(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZIZZ)V
    return-void

    # noTypingRow
    :cond_notyping
    invoke-static {v1}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getNoTypingRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v0
    if-ne p2, v0, :cond_noupload
    const-string v5, "Ocultar Digitando"
    sget-boolean v6, Lcom/radolyn/ayugram/AyuConfig;->sendTypingPackets:Z
    xor-int/lit8 v6, v6, 0x1
    const-string v4, ""
    invoke-virtual {v3, v5, v4, v6, v7, v6, v7}, Lorg/telegram/ui/Cells/j;->d(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZIZZ)V
    return-void

    # noUploadRow
    :cond_noupload
    invoke-static {v1}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getNoUploadRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v0
    if-ne p2, v0, :cond_offline
    const-string v5, "Ocultar Upload"
    sget-boolean v6, Lcom/radolyn/ayugram/AyuConfig;->sendUploadProgress:Z
    xor-int/lit8 v6, v6, 0x1
    const-string v4, ""
    invoke-virtual {v3, v5, v4, v6, v7, v6, v7}, Lorg/telegram/ui/Cells/j;->d(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZIZZ)V
    return-void

    # offlineAfterOnlineRow
    :cond_offline
    invoke-static {v1}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getOfflineAfterOnlineRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v0
    if-ne p2, v0, :cond_markread
    const-string v5, "Ficar off-line automaticamente"
    sget-boolean v6, Lcom/radolyn/ayugram/AyuConfig;->sendOfflinePacketAfterOnline:Z
    const-string v4, ""
    invoke-virtual {v3, v5, v4, v6, v7, v6, v7}, Lorg/telegram/ui/Cells/j;->d(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZIZZ)V
    return-void

    # markReadAfterSendRow
    :cond_markread
    invoke-static {v1}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getMarkReadAfterSendRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v0
    if-ne p2, v0, :cond_alert
    const-string v5, "Ler ao interagir"
    sget-boolean v6, Lcom/radolyn/ayugram/AyuConfig;->markReadAfterSend:Z
    const-string v4, ""
    invoke-virtual {v3, v5, v4, v6, v7, v6, v7}, Lorg/telegram/ui/Cells/j;->d(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZIZZ)V
    return-void

    # ghostAlertStoriesRow
    :cond_alert
    invoke-static {v1}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->access$getGhostAlertStoriesRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    move-result v0
    if-ne p2, v0, :cond_end
    const-string v5, "Alerta do modo fantasma nos Stories"
    sget-boolean v6, Lcom/radolyn/ayugram/AyuConfig;->ghostModeAlertStories:Z
    const-string v4, ""
    invoke-virtual {v3, v5, v4, v6, v7, v6, v7}, Lorg/telegram/ui/Cells/j;->d(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZIZZ)V

    :cond_end
    return-void
.end method

.method public isEnabled(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)Z
    .locals 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getItemViewType()I
    move-result v0
    const/4 p1, 0x2
    if-ne v0, p1, :cond_false
    const/4 v0, 0x1
    return v0
    :cond_false
    const/4 v0, 0x0
    return v0
.end method
