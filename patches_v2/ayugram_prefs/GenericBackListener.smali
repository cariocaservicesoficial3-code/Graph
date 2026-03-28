.class public Lcom/radolyn/ayugram/preferences/GenericBackListener;
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
