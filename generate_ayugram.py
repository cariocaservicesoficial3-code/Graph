#!/usr/bin/env python3
"""
Generate all AyuGram smali files for Telegraph integration:
1. AyuGramPreferencesActivity - Main panel with categories
2. GhostModePreferencesActivity - Ghost mode settings
3. SpyPreferencesActivity - Spy/espionage settings
4. CustomizationPreferencesActivity - Customization settings
5. AyuMessageUtils - Deleted message mark utility
6. Patches for ChatMessageCell, TLRPC$Message, LaunchActivity, Yt0
"""

import os

BASE = "/home/ubuntu/Graph/decompiled"
PREFS_DIR = f"{BASE}/smali/com/radolyn/ayugram/preferences"
UTILS_DIR = f"{BASE}/smali/com/radolyn/ayugram/utils"

os.makedirs(PREFS_DIR, exist_ok=True)
os.makedirs(UTILS_DIR, exist_ok=True)

# ============================================================
# 1. AyuGramPreferencesActivity - Main Panel
# ============================================================
main_activity = r""".class public Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;
.super Lorg/telegram/ui/ActionBar/cOm7;

# instance fields
.field private listView:Lorg/telegram/ui/Components/RecyclerListView;
.field private listAdapter:Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ListAdapter;

.field private headerRow:I
.field private ghostModeRow:I
.field private spyRow:I
.field private customizationRow:I
.field private headerShadowRow:I
.field private linksHeaderRow:I
.field private channelRow:I
.field private linksShadowRow:I
.field private rowCount:I

# direct methods
.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Lorg/telegram/ui/ActionBar/cOm7;-><init>()V
    return-void
.end method

.method public onFragmentCreate()Z
    .locals 2

    invoke-super {p0}, Lorg/telegram/ui/ActionBar/cOm7;->onFragmentCreate()Z

    const/4 v0, 0x0
    iput v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->headerRow:I

    const/4 v0, 0x1
    iput v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->ghostModeRow:I

    const/4 v0, 0x2
    iput v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->spyRow:I

    const/4 v0, 0x3
    iput v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->customizationRow:I

    const/4 v0, 0x4
    iput v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->headerShadowRow:I

    const/4 v0, 0x5
    iput v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->linksHeaderRow:I

    const/4 v0, 0x6
    iput v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->channelRow:I

    const/4 v0, 0x7
    iput v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->linksShadowRow:I

    const/16 v0, 0x8
    iput v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->rowCount:I

    const/4 v1, 0x1
    return v1
.end method

.method public createView(Landroid/content/Context;)Landroid/view/View;
    .locals 6

    invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->ensureLoaded()V

    # Setup ActionBar
    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    sget v1, Lorg/telegram/messenger/R$drawable;->ic_ab_back:I
    invoke-virtual {v0, v1}, Lorg/telegram/ui/ActionBar/AUX;->setBackButtonImage(I)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Lorg/telegram/ui/ActionBar/AUX;->setAllowOverlayTitle(Z)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    const-string v2, "AyuGram"
    invoke-virtual {v0, v2}, Lorg/telegram/ui/ActionBar/AUX;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    new-instance v2, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$BackListener;
    invoke-direct {v2, p0}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$BackListener;-><init>(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)V
    invoke-virtual {v0, v2}, Lorg/telegram/ui/ActionBar/AUX;->setActionBarMenuOnItemClick(Lorg/telegram/ui/ActionBar/AUX$con;)V

    # Create FrameLayout
    new-instance v0, Landroid/widget/FrameLayout;
    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->fragmentView:Landroid/view/View;

    sget v2, Lorg/telegram/ui/ActionBar/q;->Z7:I
    invoke-static {v2}, Lorg/telegram/ui/ActionBar/q;->u2(I)I
    move-result v2
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->fragmentView:Landroid/view/View;
    check-cast v0, Landroid/widget/FrameLayout;

    # Create RecyclerListView
    new-instance v2, Lorg/telegram/ui/Components/RecyclerListView;
    invoke-direct {v2, p1}, Lorg/telegram/ui/Components/RecyclerListView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->listView:Lorg/telegram/ui/Components/RecyclerListView;

    invoke-virtual {v2, v1}, Lorg/telegram/ui/Components/RecyclerListView;->setVerticalScrollBarEnabled(Z)V

    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;
    const/4 v4, 0x1
    invoke-direct {v3, p1, v4, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V
    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    # Create adapter
    new-instance v3, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ListAdapter;
    invoke-direct {v3, p0, p1}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ListAdapter;-><init>(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;Landroid/content/Context;)V
    iput-object v3, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->listAdapter:Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ListAdapter;

    invoke-virtual {v2, v3}, Lorg/telegram/ui/Components/RecyclerListView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    # Add to frame
    const/4 v3, -0x1
    const/16 v5, 0x33
    invoke-static {v3, v3, v5}, Lorg/telegram/ui/Components/rq;->e(III)Landroid/widget/FrameLayout$LayoutParams;
    move-result-object v3
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # Set click listener
    new-instance v3, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ClickListener;
    invoke-direct {v3, p0}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ClickListener;-><init>(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)V
    invoke-virtual {v2, v3}, Lorg/telegram/ui/Components/RecyclerListView;->setOnItemClickListener(Lorg/telegram/ui/Components/RecyclerListView$OnItemClickListener;)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->fragmentView:Landroid/view/View;
    return-object v0
.end method

# Accessor methods for inner classes
.method static synthetic access$getGhostModeRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->ghostModeRow:I
    return p0
.end method

.method static synthetic access$getSpyRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->spyRow:I
    return p0
.end method

.method static synthetic access$getCustomizationRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->customizationRow:I
    return p0
.end method

.method static synthetic access$getChannelRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->channelRow:I
    return p0
.end method

.method static synthetic access$getRowCount(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->rowCount:I
    return p0
.end method

.method static synthetic access$getHeaderRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->headerRow:I
    return p0
.end method

.method static synthetic access$getHeaderShadowRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->headerShadowRow:I
    return p0
.end method

.method static synthetic access$getLinksHeaderRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->linksHeaderRow:I
    return p0
.end method

.method static synthetic access$getLinksShadowRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->linksShadowRow:I
    return p0
.end method
"""

with open(f"{PREFS_DIR}/AyuGramPreferencesActivity.smali", "w") as f:
    f.write(main_activity)

# ============================================================
# BackListener inner class
# ============================================================
back_listener = r""".class public Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$BackListener;
.super Lorg/telegram/ui/ActionBar/AUX$con;

.field final synthetic this$0:Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;

.method public constructor <init>(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)V
    .locals 0
    iput-object p1, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$BackListener;->this$0:Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;
    invoke-direct {p0}, Lorg/telegram/ui/ActionBar/AUX$con;-><init>()V
    return-void
.end method

.method public onItemClick(I)V
    .locals 1
    const/high16 v0, -0x1000000
    if-ne p1, v0, :cond_end
    iget-object v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$BackListener;->this$0:Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;
    invoke-virtual {v0}, Lorg/telegram/ui/ActionBar/cOm7;->finishFragment()V
    :cond_end
    return-void
.end method
"""

with open(f"{PREFS_DIR}/AyuGramPreferencesActivity$BackListener.smali", "w") as f:
    f.write(back_listener)

# ============================================================
# ClickListener inner class
# ============================================================
click_listener = r""".class public Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ClickListener;
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
"""

with open(f"{PREFS_DIR}/AyuGramPreferencesActivity$ClickListener.smali", "w") as f:
    f.write(click_listener)

# ============================================================
# ListAdapter inner class for main panel
# ============================================================
list_adapter = r""".class public Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ListAdapter;
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
"""

with open(f"{PREFS_DIR}/AyuGramPreferencesActivity$ListAdapter.smali", "w") as f:
    f.write(list_adapter)

# ============================================================
# 2. GhostModePreferencesActivity
# ============================================================
ghost_activity = r""".class public Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;
.super Lorg/telegram/ui/ActionBar/cOm7;

.field private listView:Lorg/telegram/ui/Components/RecyclerListView;
.field private listAdapter:Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;

.field private headerRow:I
.field private ghostModeRow:I
.field private noReadRow:I
.field private noOnlineRow:I
.field private noTypingRow:I
.field private noUploadRow:I
.field private offlineAfterOnlineRow:I
.field private ghostShadowRow:I
.field private featuresHeaderRow:I
.field private markReadAfterSendRow:I
.field private ghostAlertStoriesRow:I
.field private featuresShadowRow:I
.field private rowCount:I

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Lorg/telegram/ui/ActionBar/cOm7;-><init>()V
    return-void
.end method

.method public onFragmentCreate()Z
    .locals 2

    invoke-super {p0}, Lorg/telegram/ui/ActionBar/cOm7;->onFragmentCreate()Z

    invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->ensureLoaded()V

    const/4 v0, 0x0
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->headerRow:I
    const/4 v0, 0x1
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->ghostModeRow:I
    const/4 v0, 0x2
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->noReadRow:I
    const/4 v0, 0x3
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->noOnlineRow:I
    const/4 v0, 0x4
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->noTypingRow:I
    const/4 v0, 0x5
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->noUploadRow:I
    const/4 v0, 0x6
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->offlineAfterOnlineRow:I
    const/4 v0, 0x7
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->ghostShadowRow:I
    const/16 v0, 0x8
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->featuresHeaderRow:I
    const/16 v0, 0x9
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->markReadAfterSendRow:I
    const/16 v0, 0xa
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->ghostAlertStoriesRow:I
    const/16 v0, 0xb
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->featuresShadowRow:I
    const/16 v0, 0xc
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->rowCount:I

    const/4 v1, 0x1
    return v1
.end method

.method public createView(Landroid/content/Context;)Landroid/view/View;
    .locals 6

    # ActionBar
    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    sget v1, Lorg/telegram/messenger/R$drawable;->ic_ab_back:I
    invoke-virtual {v0, v1}, Lorg/telegram/ui/ActionBar/AUX;->setBackButtonImage(I)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Lorg/telegram/ui/ActionBar/AUX;->setAllowOverlayTitle(Z)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    const-string v2, "Modo Fantasma"
    invoke-virtual {v0, v2}, Lorg/telegram/ui/ActionBar/AUX;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    new-instance v2, Lcom/radolyn/ayugram/preferences/GenericBackListener;
    invoke-direct {v2, p0}, Lcom/radolyn/ayugram/preferences/GenericBackListener;-><init>(Lorg/telegram/ui/ActionBar/cOm7;)V
    invoke-virtual {v0, v2}, Lorg/telegram/ui/ActionBar/AUX;->setActionBarMenuOnItemClick(Lorg/telegram/ui/ActionBar/AUX$con;)V

    # FrameLayout
    new-instance v0, Landroid/widget/FrameLayout;
    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->fragmentView:Landroid/view/View;
    sget v2, Lorg/telegram/ui/ActionBar/q;->Z7:I
    invoke-static {v2}, Lorg/telegram/ui/ActionBar/q;->u2(I)I
    move-result v2
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->fragmentView:Landroid/view/View;
    check-cast v0, Landroid/widget/FrameLayout;

    # RecyclerListView
    new-instance v2, Lorg/telegram/ui/Components/RecyclerListView;
    invoke-direct {v2, p1}, Lorg/telegram/ui/Components/RecyclerListView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->listView:Lorg/telegram/ui/Components/RecyclerListView;
    invoke-virtual {v2, v1}, Lorg/telegram/ui/Components/RecyclerListView;->setVerticalScrollBarEnabled(Z)V

    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;
    const/4 v4, 0x1
    invoke-direct {v3, p1, v4, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V
    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    new-instance v3, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;
    invoke-direct {v3, p0, p1}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;-><init>(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;Landroid/content/Context;)V
    iput-object v3, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->listAdapter:Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;
    invoke-virtual {v2, v3}, Lorg/telegram/ui/Components/RecyclerListView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    const/4 v3, -0x1
    const/16 v5, 0x33
    invoke-static {v3, v3, v5}, Lorg/telegram/ui/Components/rq;->e(III)Landroid/widget/FrameLayout$LayoutParams;
    move-result-object v3
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ClickListener;
    invoke-direct {v3, p0}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ClickListener;-><init>(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)V
    invoke-virtual {v2, v3}, Lorg/telegram/ui/Components/RecyclerListView;->setOnItemClickListener(Lorg/telegram/ui/Components/RecyclerListView$OnItemClickListener;)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->fragmentView:Landroid/view/View;
    return-object v0
.end method

# Accessor methods
.method static synthetic access$getGhostModeRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->ghostModeRow:I
    return p0
.end method

.method static synthetic access$getNoReadRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->noReadRow:I
    return p0
.end method

.method static synthetic access$getNoOnlineRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->noOnlineRow:I
    return p0
.end method

.method static synthetic access$getNoTypingRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->noTypingRow:I
    return p0
.end method

.method static synthetic access$getNoUploadRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->noUploadRow:I
    return p0
.end method

.method static synthetic access$getOfflineAfterOnlineRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->offlineAfterOnlineRow:I
    return p0
.end method

.method static synthetic access$getMarkReadAfterSendRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->markReadAfterSendRow:I
    return p0
.end method

.method static synthetic access$getGhostAlertStoriesRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->ghostAlertStoriesRow:I
    return p0
.end method

.method static synthetic access$getHeaderRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->headerRow:I
    return p0
.end method

.method static synthetic access$getGhostShadowRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->ghostShadowRow:I
    return p0
.end method

.method static synthetic access$getFeaturesHeaderRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->featuresHeaderRow:I
    return p0
.end method

.method static synthetic access$getFeaturesShadowRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->featuresShadowRow:I
    return p0
.end method

.method static synthetic access$getRowCount(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->rowCount:I
    return p0
.end method

.method static synthetic access$getListAdapter(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;
    .locals 0
    iget-object p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->listAdapter:Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;
    return-object p0
.end method
"""

with open(f"{PREFS_DIR}/GhostModePreferencesActivity.smali", "w") as f:
    f.write(ghost_activity)

print("Main activities written. Continuing with inner classes...")

# ============================================================
# GenericBackListener - reusable back button handler
# ============================================================
generic_back = r""".class public Lcom/radolyn/ayugram/preferences/GenericBackListener;
.super Lorg/telegram/ui/ActionBar/AUX$con;

.field final synthetic fragment:Lorg/telegram/ui/ActionBar/cOm7;

.method public constructor <init>(Lorg/telegram/ui/ActionBar/cOm7;)V
    .locals 0
    iput-object p1, p0, Lcom/radolyn/ayugram/preferences/GenericBackListener;->fragment:Lorg/telegram/ui/ActionBar/cOm7;
    invoke-direct {p0}, Lorg/telegram/ui/ActionBar/AUX$con;-><init>()V
    return-void
.end method

.method public onItemClick(I)V
    .locals 1
    const/high16 v0, -0x1000000
    if-ne p1, v0, :cond_end
    iget-object v0, p0, Lcom/radolyn/ayugram/preferences/GenericBackListener;->fragment:Lorg/telegram/ui/ActionBar/cOm7;
    invoke-virtual {v0}, Lorg/telegram/ui/ActionBar/cOm7;->finishFragment()V
    :cond_end
    return-void
.end method
"""

with open(f"{PREFS_DIR}/GenericBackListener.smali", "w") as f:
    f.write(generic_back)

# ============================================================
# GhostMode ClickListener
# ============================================================
ghost_click = r""".class public Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ClickListener;
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
"""

with open(f"{PREFS_DIR}/GhostModePreferencesActivity$ClickListener.smali", "w") as f:
    f.write(ghost_click)

print("Ghost mode click listener written. Continuing...")

# ============================================================
# GhostMode ListAdapter
# ============================================================
ghost_adapter = r""".class public Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;
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
"""

with open(f"{PREFS_DIR}/GhostModePreferencesActivity$ListAdapter.smali", "w") as f:
    f.write(ghost_adapter)

print("Ghost mode adapter written. Now creating Spy and Customization activities...")

# ============================================================
# 3. SpyPreferencesActivity (simplified - same pattern)
# ============================================================
spy_activity = r""".class public Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;
.super Lorg/telegram/ui/ActionBar/cOm7;

.field private listView:Lorg/telegram/ui/Components/RecyclerListView;
.field private listAdapter:Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity$ListAdapter;

.field private headerRow:I
.field private saveDeletedRow:I
.field private saveHistoryRow:I
.field private saveForBotsRow:I
.field private shadowRow:I
.field private rowCount:I

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Lorg/telegram/ui/ActionBar/cOm7;-><init>()V
    return-void
.end method

.method public onFragmentCreate()Z
    .locals 2
    invoke-super {p0}, Lorg/telegram/ui/ActionBar/cOm7;->onFragmentCreate()Z
    invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->ensureLoaded()V

    const/4 v0, 0x0
    iput v0, p0, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;->headerRow:I
    const/4 v0, 0x1
    iput v0, p0, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;->saveDeletedRow:I
    const/4 v0, 0x2
    iput v0, p0, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;->saveHistoryRow:I
    const/4 v0, 0x3
    iput v0, p0, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;->saveForBotsRow:I
    const/4 v0, 0x4
    iput v0, p0, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;->shadowRow:I
    const/4 v0, 0x5
    iput v0, p0, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;->rowCount:I

    const/4 v1, 0x1
    return v1
.end method

.method public createView(Landroid/content/Context;)Landroid/view/View;
    .locals 6

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    sget v1, Lorg/telegram/messenger/R$drawable;->ic_ab_back:I
    invoke-virtual {v0, v1}, Lorg/telegram/ui/ActionBar/AUX;->setBackButtonImage(I)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Lorg/telegram/ui/ActionBar/AUX;->setAllowOverlayTitle(Z)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    const-string v2, "Espionagem"
    invoke-virtual {v0, v2}, Lorg/telegram/ui/ActionBar/AUX;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    new-instance v2, Lcom/radolyn/ayugram/preferences/GenericBackListener;
    invoke-direct {v2, p0}, Lcom/radolyn/ayugram/preferences/GenericBackListener;-><init>(Lorg/telegram/ui/ActionBar/cOm7;)V
    invoke-virtual {v0, v2}, Lorg/telegram/ui/ActionBar/AUX;->setActionBarMenuOnItemClick(Lorg/telegram/ui/ActionBar/AUX$con;)V

    new-instance v0, Landroid/widget/FrameLayout;
    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->fragmentView:Landroid/view/View;
    sget v2, Lorg/telegram/ui/ActionBar/q;->Z7:I
    invoke-static {v2}, Lorg/telegram/ui/ActionBar/q;->u2(I)I
    move-result v2
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->fragmentView:Landroid/view/View;
    check-cast v0, Landroid/widget/FrameLayout;

    new-instance v2, Lorg/telegram/ui/Components/RecyclerListView;
    invoke-direct {v2, p1}, Lorg/telegram/ui/Components/RecyclerListView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;->listView:Lorg/telegram/ui/Components/RecyclerListView;
    invoke-virtual {v2, v1}, Lorg/telegram/ui/Components/RecyclerListView;->setVerticalScrollBarEnabled(Z)V

    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;
    const/4 v4, 0x1
    invoke-direct {v3, p1, v4, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V
    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    new-instance v3, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity$ListAdapter;
    invoke-direct {v3, p0, p1}, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity$ListAdapter;-><init>(Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;Landroid/content/Context;)V
    iput-object v3, p0, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;->listAdapter:Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity$ListAdapter;
    invoke-virtual {v2, v3}, Lorg/telegram/ui/Components/RecyclerListView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    const/4 v3, -0x1
    const/16 v5, 0x33
    invoke-static {v3, v3, v5}, Lorg/telegram/ui/Components/rq;->e(III)Landroid/widget/FrameLayout$LayoutParams;
    move-result-object v3
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity$ClickListener;
    invoke-direct {v3, p0}, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity$ClickListener;-><init>(Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;)V
    invoke-virtual {v2, v3}, Lorg/telegram/ui/Components/RecyclerListView;->setOnItemClickListener(Lorg/telegram/ui/Components/RecyclerListView$OnItemClickListener;)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->fragmentView:Landroid/view/View;
    return-object v0
.end method

# Accessors
.method static synthetic access$getHeaderRow(Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;->headerRow:I
    return p0
.end method
.method static synthetic access$getSaveDeletedRow(Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;->saveDeletedRow:I
    return p0
.end method
.method static synthetic access$getSaveHistoryRow(Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;->saveHistoryRow:I
    return p0
.end method
.method static synthetic access$getSaveForBotsRow(Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;->saveForBotsRow:I
    return p0
.end method
.method static synthetic access$getShadowRow(Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;->shadowRow:I
    return p0
.end method
.method static synthetic access$getRowCount(Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/SpyPreferencesActivity;->rowCount:I
    return p0
.end method
"""

with open(f"{PREFS_DIR}/SpyPreferencesActivity.smali", "w") as f:
    f.write(spy_activity)

print("Spy activity written. Now creating Spy inner classes...")

# Write remaining files in next part
print("Part 1 complete!")
