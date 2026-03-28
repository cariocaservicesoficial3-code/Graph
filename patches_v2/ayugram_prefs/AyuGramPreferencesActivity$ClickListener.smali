.class public Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ClickListener;
.super Ljava/lang/Object;
.implements Lorg/telegram/ui/Components/RecyclerListView$OnItemClickListener;

.field final synthetic this$0:Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;

.method public constructor <init>(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)V
    .locals 0
    iput-object p1, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ClickListener;->this$0:Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public onItemClick(Landroid/view/View;I)V
    .locals 2

    iget-object v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ClickListener;->this$0:Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;

    # Check ghostModeRow
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->access$getGhostModeRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    move-result v1
    if-ne p2, v1, :cond_spy

    new-instance v1, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;
    invoke-direct {v1}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;-><init>()V
    invoke-virtual {v0, v1}, Lorg/telegram/ui/ActionBar/cOm7;->presentFragment(Lorg/telegram/ui/ActionBar/cOm7;)Z
    return-void

    :cond_spy
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->access$getSpyRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    move-result v1
    if-ne p2, v1, :cond_custom

    new-instance v1, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;
    invoke-direct {v1}, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;-><init>()V
    invoke-virtual {v0, v1}, Lorg/telegram/ui/ActionBar/cOm7;->presentFragment(Lorg/telegram/ui/ActionBar/cOm7;)Z
    return-void

    :cond_custom
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->access$getCustomizationRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    move-result v1
    if-ne p2, v1, :cond_channel

    new-instance v1, Lcom/radolyn/ayugram/preferences/CustomizationPreferencesActivity;
    invoke-direct {v1}, Lcom/radolyn/ayugram/preferences/CustomizationPreferencesActivity;-><init>()V
    invoke-virtual {v0, v1}, Lorg/telegram/ui/ActionBar/cOm7;->presentFragment(Lorg/telegram/ui/ActionBar/cOm7;)Z
    return-void

    :cond_channel
    invoke-static {v0}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->access$getChannelRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    move-result v1
    if-ne p2, v1, :cond_end

    # Open @ayugram channel
    invoke-virtual {v0}, Lorg/telegram/ui/ActionBar/cOm7;->getParentActivity()Landroid/app/Activity;
    move-result-object v1
    if-eqz v1, :cond_end
    const-string v1, "https://t.me/ayugram"
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v1
    new-instance p1, Landroid/content/Intent;
    const-string p2, "android.intent.action.VIEW"
    invoke-direct {p1, p2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V
    invoke-virtual {v0}, Lorg/telegram/ui/ActionBar/cOm7;->getParentActivity()Landroid/app/Activity;
    move-result-object v1
    invoke-virtual {v1, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :cond_end
    return-void
.end method
