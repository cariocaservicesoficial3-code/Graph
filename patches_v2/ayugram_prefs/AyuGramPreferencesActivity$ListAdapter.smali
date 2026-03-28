.class public Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ListAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;

.field final synthetic this$0:Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;
.field private mContext:Landroid/content/Context;

.method public constructor <init>(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;Landroid/content/Context;)V
    .locals 0
    iput-object p1, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ListAdapter;->this$0:Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;
    iput-object p2, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ListAdapter;->mContext:Landroid/content/Context;
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V
    return-void
.end method

.method public getItemCount()I
    .locals 1
    iget-object v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ListAdapter;->this$0:Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->access$getRowCount(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    move-result v0
    return v0
.end method

.method public getItemViewType(I)I
    .locals 2
    iget-object v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ListAdapter;->this$0:Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;

    # headerRow or linksHeaderRow -> type 0 (HeaderCell)
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->access$getHeaderRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    move-result v1
    if-eq p1, v1, :type_header

    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->access$getLinksHeaderRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    move-result v1
    if-eq p1, v1, :type_header

    # shadow rows -> type 1 (ShadowSection)
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->access$getHeaderShadowRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    move-result v1
    if-eq p1, v1, :type_shadow

    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->access$getLinksShadowRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    move-result v1
    if-eq p1, v1, :type_shadow

    # everything else -> type 2 (TextCell)
    const/4 v1, 0x2
    return v1

    :type_header
    const/4 v1, 0x0
    return v1

    :type_shadow
    const/4 v1, 0x1
    return v1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 3

    iget-object v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ListAdapter;->mContext:Landroid/content/Context;

    packed-switch p2, :pswitch_data_0

    # default - TextCell
    new-instance v1, Lorg/telegram/ui/Cells/S0;
    invoke-direct {v1, v0}, Lorg/telegram/ui/Cells/S0;-><init>(Landroid/content/Context;)V
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
    iget-object p2, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ListAdapter;->mContext:Landroid/content/Context;
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
    .locals 4

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getItemViewType()I
    move-result v0

    iget-object v1, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ListAdapter;->this$0:Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;

    # type 0 = HeaderCell
    if-nez v0, :cond_not_header
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I
    move-result v2
    iget-object v3, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;
    check-cast v3, Lorg/telegram/ui/Cells/g1;

    invoke-static {v1}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->access$getHeaderRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    move-result v0
    if-ne v2, v0, :cond_links_header
    const-string v0, "Categorias"
    invoke-virtual {v3, v0}, Lorg/telegram/ui/Cells/g1;->setText(Ljava/lang/String;)V
    goto :cond_header_done

    :cond_links_header
    const-string v0, "Links"
    invoke-virtual {v3, v0}, Lorg/telegram/ui/Cells/g1;->setText(Ljava/lang/String;)V

    :cond_header_done
    return-void

    :cond_not_header
    # type 1 = Shadow - nothing to bind
    const/4 v2, 0x1
    if-ne v0, v2, :cond_not_shadow
    return-void

    :cond_not_shadow
    # type 2 = TextCell
    iget-object v3, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;
    check-cast v3, Lorg/telegram/ui/Cells/S0;

    invoke-static {v1}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->access$getGhostModeRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    move-result v0
    if-ne p2, v0, :cond_not_ghost
    const-string v0, "Modo Fantasma"
    sget v2, Lorg/telegram/messenger/R$drawable;->msg_secret:I
    const/4 v1, 0x1
    invoke-virtual {v3, v0, v2, v1}, Lorg/telegram/ui/Cells/S0;->p(Ljava/lang/CharSequence;IZ)V
    return-void

    :cond_not_ghost
    invoke-static {v1}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->access$getSpyRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    move-result v0
    if-ne p2, v0, :cond_not_spy
    const-string v0, "Espionagem"
    sget v2, Lorg/telegram/messenger/R$drawable;->msg_viewintopic:I
    const/4 v1, 0x1
    invoke-virtual {v3, v0, v2, v1}, Lorg/telegram/ui/Cells/S0;->p(Ljava/lang/CharSequence;IZ)V
    return-void

    :cond_not_spy
    invoke-static {v1}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->access$getCustomizationRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    move-result v0
    if-ne p2, v0, :cond_not_custom
    const-string v0, "Personaliza\u00e7\u00e3o"
    sget v2, Lorg/telegram/messenger/R$drawable;->msg_customize:I
    const/4 v1, 0x0
    invoke-virtual {v3, v0, v2, v1}, Lorg/telegram/ui/Cells/S0;->p(Ljava/lang/CharSequence;IZ)V
    return-void

    :cond_not_custom
    invoke-static {v1}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->access$getChannelRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    move-result v0
    if-ne p2, v0, :cond_end
    const-string v0, "Canal @ayugram"
    sget v2, Lorg/telegram/messenger/R$drawable;->msg_channel:I
    const/4 v1, 0x0
    invoke-virtual {v3, v0, v2, v1}, Lorg/telegram/ui/Cells/S0;->p(Ljava/lang/CharSequence;IZ)V

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

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
