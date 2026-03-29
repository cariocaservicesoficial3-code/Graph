# Checkpoint CP-003: Painel Completo AyuGram - Analise e Implementacao

## Data: 2026-03-28

## Resumo

Sessao focada em implementar o painel completo e funcional do AyuGram no Telegraph, incluindo todas as sub-telas (Modo Fantasma, Espionagem, Filtros, Personalizacao), marcas visuais de mensagens deletadas/editadas, e integracao no drawer do Telegraph.

## Estado Anterior (CP-002)

O que ja estava implementado antes desta sessao:

| Funcionalidade | Status CP-002 | Detalhes |
|---|---|---|
| AyuConfig.smali | Implementado | Classe de config com SharedPreferences em `smali/com/radolyn/ayugram/` |
| Anti-Delete (NnnOfficial) | Implementado | Forcado true em `smali/org/telegram/Nnn/Official.smali` |
| Ghost - Nao ler mensagens | Implementado | Hook em `smali_classes6/org/telegram/messenger/Iq.smali` linha 91210 |
| Ghost - Ocultar digitando | Implementado | Hook em `Iq.smali` linha 132829 |
| Ghost - Ocultar online | Implementado | Hook em `Iq.smali` linha 148238 |
| Ghost - Nao ver stories | Implementado | Hook em `smali_classes9/org/telegram/ui/Stories/t2.smali` linha 9025 |
| Tela de configuracoes UI | NAO implementado | Nenhuma Activity de preferencias no APK |
| Marcas visuais (lixeira/lapis) | NAO implementado | Sem hooks no ChatMessageCell |
| Integracao no drawer | NAO implementado | Sem entrada no menu lateral |
| Filtros | NAO implementado | Sem tela de filtros |
| Personalizacao | NAO implementado | Sem tela de personalizacao |

## Ambiente de Desenvolvimento

| Ferramenta | Versao | Localizacao |
|---|---|---|
| OpenJDK | 17.0.18 | /usr/lib/jvm/java-17-openjdk-amd64 |
| apktool | 2.9.3 | /usr/local/bin/apktool (wrapper) + /usr/local/bin/apktool.jar |
| zipalign | 10.0.0 | /usr/bin/zipalign |
| apksigner | - | /usr/bin/apksigner |
| git-lfs | 3.7.1 | /usr/bin/git-lfs |

## APK Base

O APK base e o `Telegraph_AyuGram_Mod.apk` do repositorio (75MB, baixado via git-lfs). Este APK ja contem os hooks do CP-002 (Ghost Mode + Anti-Delete). Foi descompilado com sucesso em `/home/ubuntu/Graph/decompiled/`.

## Mapeamento de Classes do Telegraph (Atualizado)

### Classes Core

| Classe Real | Classe Obfuscada | Localizacao |
|---|---|---|
| BaseFragment | cOm7 | smali_classes8/org/telegram/ui/ActionBar/cOm7.smali |
| ActionBar | AUX | smali_classes8/org/telegram/ui/ActionBar/AUX.smali |
| ActionBar.OnItemClick | AUX$con | smali_classes8/org/telegram/ui/ActionBar/AUX$con.smali |
| ApplicationLoader.context | cOM4.b | smali_classes6/org/telegram/messenger/cOM4.smali |
| MessageObject | Yg | smali_classes6/org/telegram/messenger/Yg.smali |
| ChatMessageCell | Com6 | smali_classes8/org/telegram/ui/Cells/Com6.smali |
| MessagesController | Iq | smali_classes6/org/telegram/messenger/Iq.smali |
| MessagesStorage | bw | smali_classes6/org/telegram/messenger/bw.smali |
| StoriesController | t2 | smali_classes9/org/telegram/ui/Stories/t2.smali |
| LaunchActivity | LaunchActivity | smali_classes7/org/telegram/ui/LaunchActivity.smali |
| ExteraGram Settings | Yt0 | smali_classes7/org/telegram/ui/Yt0.smali |
| Theme | q | smali_classes8/org/telegram/ui/ActionBar/q.smali |
| RecyclerListView | RecyclerListView | smali_classes8/org/telegram/ui/Components/RecyclerListView.smali |
| Official (Anti-Delete) | Official | smali/org/telegram/Nnn/Official.smali |

### Celulas de UI

| Tipo | Classe | Funcao |
|---|---|---|
| HeaderCell | g1 | Cabecalho de secao |
| ShadowSectionCell | h1 | Divisor com fundo cinza |
| TextCheckCell | j | Toggle switch (checkbox) |
| TextCell | S0 | Texto com icone |
| TextSettingsCell | U0 | Texto com valor |
| FrameLayout$LayoutParams | rq.e(III) | Helper para LayoutParams |

### Metodos de Celulas

| Celula | Metodo | Assinatura | Funcao |
|---|---|---|---|
| j (TextCheckCell) | d | (CharSequence, CharSequence, Z, I, Z, Z)V | setTextAndCheck |
| j (TextCheckCell) | setChecked | (Z)V | Alterar estado do toggle |
| S0 (TextCell) | p | (CharSequence, I, Z)V | setTextAndIcon |
| U0 (TextSettingsCell) | j | (String, String, Z, Z, Z)V | setTextAndValue |
| g1 (HeaderCell) | setText | (String)V | Definir texto do cabecalho |

### Drawer Menu do Telegraph

O Telegraph usa um sistema de drawer baseado em banco de dados SQLite (tabela `main_menu`). O `LaunchActivity` despacha fragments baseado no campo `b` (nome string) do `MainMenuItem`.

**Padrao de despacho no LaunchActivity (linha ~3600):**
```
const-string v2, "settings_telegraph"
invoke-virtual {v2, v1}, String->equals(Object)Z
move-result v2
if-eqz v2, :cond_next
new-instance v1, Lorg/telegram/ui/Yt0;
invoke-direct {v1, v6}, Lorg/telegram/ui/Yt0;-><init>(String)V
invoke-virtual {v0, v1}, LaunchActivity->i5(cOm7)V  # presentFragment
iget-object v0, v0, LaunchActivity->L:DrawerLayoutContainer;
invoke-virtual {v0, v4}, DrawerLayoutContainer->f(Z)V  # closeDrawer
return-void
```

**Para adicionar AyuGram no drawer:** Inserir bloco similar antes do `settings_telegraph` check, usando nome `"ayugram_settings"`, instanciando `AyuGramPreferencesActivity`.

### MessageObject (Yg) - Campos de Deletado

| Campo | Tipo | Funcao |
|---|---|---|
| deleted | boolean | Indica se a mensagem foi deletada |
| deletedByThanos | boolean | Indica se foi deletada pelo Thanos (animacao) |

O campo `deleted` ja e verificado no `Com6.smali` (ChatMessageCell) em multiplos pontos (linhas 22912, 86592, 94108, 121062, 131880, 173736). Quando `deleted=true` e `deletedByThanos=false`, a mensagem e tratada como deletada pelo anti-delete do Telegraph.

## Arquivos Smali a Criar/Modificar

### Novos Arquivos (Painel AyuGram)

| Arquivo | Diretorio | Funcao |
|---|---|---|
| AyuConfig.smali | smali/com/radolyn/ayugram/ | Config atualizada com TODOS os campos |
| AyuGramPreferencesActivity.smali | smali/com/radolyn/ayugram/preferences/ | Tela principal AyuGram |
| AyuGramPreferencesActivity$BackListener.smali | smali/com/radolyn/ayugram/preferences/ | Back button handler |
| AyuGramPreferencesActivity$ClickListener.smali | smali/com/radolyn/ayugram/preferences/ | Click handler (abre sub-telas) |
| AyuGramPreferencesActivity$ListAdapter.smali | smali/com/radolyn/ayugram/preferences/ | Adapter do RecyclerView |
| GhostModePreferencesActivity.smali | smali/com/radolyn/ayugram/preferences/ | Tela Modo Fantasma |
| GhostModePreferencesActivity$ClickListener.smali | smali/com/radolyn/ayugram/preferences/ | Click handler Ghost |
| GhostModePreferencesActivity$ListAdapter.smali | smali/com/radolyn/ayugram/preferences/ | Adapter Ghost |
| SpyPreferencesActivity.smali | smali/com/radolyn/ayugram/preferences/ | Tela Espionagem |
| SpyPreferencesActivity$ClickListener.smali | smali/com/radolyn/ayugram/preferences/ | Click handler Spy |
| SpyPreferencesActivity$ListAdapter.smali | smali/com/radolyn/ayugram/preferences/ | Adapter Spy |
| CustomizationPreferencesActivity.smali | smali/com/radolyn/ayugram/preferences/ | Tela Personalizacao |
| CustomizationPreferencesActivity$ClickListener.smali | smali/com/radolyn/ayugram/preferences/ | Click handler Custom |
| CustomizationPreferencesActivity$ListAdapter.smali | smali/com/radolyn/ayugram/preferences/ | Adapter Custom |
| GenericBackListener.smali | smali/com/radolyn/ayugram/preferences/ | Back listener reutilizavel |
| AyuMessageUtils.smali | smali/com/radolyn/ayugram/utils/ | Utilidades de marca visual |

### Arquivos a Modificar

| Arquivo | Modificacao |
|---|---|
| LaunchActivity.smali | Adicionar despacho para "ayugram_settings" |
| Yt0.smali | Adicionar row "Configuracoes do AyuGram" com link |
| Com6.smali (ChatMessageCell) | Adicionar marca visual de lixeira/lapis |
| Yg.smali (MessageObject) | Adicionar campo `ayuEdited` se necessario |

## Script de Build Atualizado

O script `patches_v2/generate_ayugram.py` ja contem a maior parte do codigo smali para as Activities. Porem falta:

1. **SpyPreferencesActivity inner classes** (ClickListener e ListAdapter) - incompleto no script
2. **CustomizationPreferencesActivity** e inner classes - nao existe
3. **AyuMessageUtils** - nao existe
4. **Patches no LaunchActivity/Yt0/Com6** - nao existe
5. **AyuConfig atualizado** - existe em patches_v2/ mas precisa ser copiado

## Proximos Passos (Nesta Sessao)

1. Criar script Python completo (`build_full_ayugram.py`) que gera TODOS os smali e aplica TODOS os patches
2. Executar o script no decompiled/
3. Recompilar DEX, substituir no APK, alinhar e assinar
4. Salvar CP-004 com resultado final
5. Fazer push de tudo para o GitHub
