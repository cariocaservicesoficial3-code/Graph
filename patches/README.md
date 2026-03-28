# Patches Aplicados ao Telegraph 12.3.1.1

## Visao Geral

Este diretorio documenta todos os patches smali aplicados ao Telegraph para implementar as funcionalidades do AyuGram. Cada patch e descrito com o arquivo modificado, a localizacao exata e o codigo inserido.

## Patch 1: AyuConfig.smali (NOVO)

**Arquivo**: `smali/com/radolyn/ayugram/AyuConfig.smali`
**Tipo**: Classe nova
**Descricao**: Classe de configuracao central que gerencia todas as preferencias do mod via SharedPreferences.

## Patch 2: Official.smali - Anti-Delete Always ON

**Arquivo**: `smali/org/telegram/Nnn/Official.smali`
**Localizacao**: Metodo `<clinit>()V` e `setNnn(Z)V`
**Descricao**: Forca NnnOfficial=true na inicializacao e impede desativacao.

### Codigo inserido no clinit:

```smali
# AyuGram: Anti-delete always ON
const/4 v0, 0x1
sput-boolean v0, Lorg/telegram/Nnn/Official;->NnnOfficial:Z
# Initialize AyuConfig
invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->ensureLoaded()V
```

### Codigo inserido no setNnn:

```smali
# AyuGram: Force anti-delete always ON
const/4 p0, 0x1
```

## Patch 3: Iq.smali - Ghost Mode Read

**Arquivo**: `smali_classes6/org/telegram/messenger/Iq.smali`
**Localizacao**: Metodo `u9(Lorg/telegram/messenger/Iq$NUl;)V` (readHistory)
**Descricao**: Bloqueia envio de confirmacao de leitura quando sendReadPackets=false.

```smali
# AyuGram Ghost Mode: Block read packets
invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->ensureLoaded()V
sget-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendReadPackets:Z
if-nez v0, :cond_ayu_send_read
return-void
:cond_ayu_send_read
```

## Patch 4: Iq.smali - Ghost Mode Typing

**Arquivo**: `smali_classes6/org/telegram/messenger/Iq.smali`
**Localizacao**: Metodo `Xf(JJILjava/lang/String;I)Z` (setTyping)
**Descricao**: Bloqueia envio de indicador de digitacao quando sendTypingPackets=false.

```smali
# AyuGram Ghost Mode: Block typing indicator
invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->ensureLoaded()V
sget-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendTypingPackets:Z
if-nez v0, :cond_ayu_send_typing
const/4 v0, 0x0
return v0
:cond_ayu_send_typing
```

## Patch 5: Iq.smali - Ghost Mode Online

**Arquivo**: `smali_classes6/org/telegram/messenger/Iq.smali`
**Localizacao**: Metodo `ih()V` (updateStatus)
**Descricao**: Bloqueia envio de status online quando sendOnlinePackets=false.

```smali
# AyuGram Ghost Mode: Block online status update
invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->ensureLoaded()V
sget-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendOnlinePackets:Z
if-nez v0, :cond_ayu_send_online
return-void
:cond_ayu_send_online
```

## Patch 6: t2.smali - Ghost Mode Stories

**Arquivo**: `smali_classes9/org/telegram/ui/Stories/t2.smali`
**Localizacao**: Metodo `G1(PeerStories;StoryItem;Z)Z` (readStories)
**Descricao**: Bloqueia marcacao de stories como vistos quando sendReadPackets=false.

```smali
# AyuGram Ghost Mode: Block stories read
invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->ensureLoaded()V
sget-boolean v0, Lcom/radolyn/ayugram/AyuConfig;->sendReadPackets:Z
if-nez v0, :cond_ayu_send_stories_read
const/4 v0, 0x0
return v0
:cond_ayu_send_stories_read
```

## Como Aplicar os Patches

Para aplicar os patches em uma nova versao do Telegraph, siga os passos descritos a seguir.

1. Descompilar o APK com `apktool d`
2. Copiar `AyuConfig.smali` para `smali/com/radolyn/ayugram/`
3. Aplicar as modificacoes nos arquivos smali conforme descrito acima
4. Compilar os dex com `apktool b`
5. Substituir os dex no APK original
6. Alinhar com `zipalign` e assinar com `apksigner`
