# Checkpoint CP-002: Implementacao Core - Anti-Delete e Ghost Mode

## Data: 2026-03-28

## Resumo

Implementacao das funcionalidades principais do AyuGram no Telegraph 12.3.1.1 via modificacao direta do codigo smali (bytecode Dalvik).

## Arquivos Criados

### AyuConfig.smali

Localizado em `smali/com/radolyn/ayugram/AyuConfig.smali`, esta classe gerencia todas as configuracoes do mod via SharedPreferences. As configuracoes sao persistidas no arquivo `ayugram_config` e carregadas automaticamente na inicializacao do app.

| Campo | Tipo | Default | Descricao |
|---|---|---|---|
| sendReadPackets | boolean | false | Quando false, nao envia confirmacao de leitura |
| sendOnlinePackets | boolean | false | Quando false, nao envia status online |
| sendUploadProgress | boolean | false | Quando false, nao envia progresso de upload |
| sendTypingPackets | boolean | false | Quando false, nao envia indicador de digitacao |
| sendOfflinePacketAfterOnline | boolean | true | Quando true, envia offline apos ficar online |
| saveDeletedMessages | boolean | true | Salvar mensagens que foram excluidas |
| saveMessagesHistory | boolean | true | Salvar historico de edicoes |
| markReadAfterSend | boolean | true | Marcar como lido ao enviar mensagem |
| saveForBots | boolean | true | Salvar mensagens de bots |
| showGhostToggleInDrawer | boolean | true | Mostrar toggle do ghost mode no drawer |

### Metodos Principais

A classe AyuConfig oferece os seguintes metodos estaticos para controle das funcionalidades.

| Metodo | Retorno | Descricao |
|---|---|---|
| ensureLoaded() | void | Garante que as configuracoes foram carregadas |
| loadConfig() | void | Carrega configuracoes do SharedPreferences |
| isGhostModeActive() | boolean | Verifica se todas as opcoes do ghost mode estao ativas |
| setGhostMode(boolean) | void | Ativa/desativa todas as opcoes do ghost mode de uma vez |
| toggleGhostMode() | void | Alterna o estado do ghost mode |
| isAntiDeleteActive() | boolean | Verifica se o anti-delete esta ativo |
| toggleSetting(String, boolean) | void | Alterna uma configuracao individual |

## Arquivos Modificados

### Official.smali (org/telegram/Nnn/Official.smali)

Duas modificacoes foram feitas neste arquivo para garantir que o anti-delete esteja sempre ativo.

**Modificacao 1 - Static Constructor**: Adicionado inicializacao do NnnOfficial como true e chamada ao AyuConfig.ensureLoaded() no bloco `<clinit>`. Isso garante que o anti-delete esteja ativo desde o momento em que a classe e carregada.

**Modificacao 2 - setNnn(boolean)**: O parametro de entrada e forcado para true antes de ser salvo, impedindo que o anti-delete seja desativado pelo usuario ou pelo sistema.

### Iq.smali (org/telegram/messenger/Iq.smali)

Tres interceptacoes foram adicionadas neste arquivo para implementar o Ghost Mode.

**Metodo u9 (readHistory)**: Adicionada verificacao de `AyuConfig.sendReadPackets` no inicio do metodo. Quando false, o metodo retorna imediatamente sem enviar a confirmacao de leitura ao servidor.

**Metodo Xf (setTyping)**: Adicionada verificacao de `AyuConfig.sendTypingPackets` no inicio do metodo. Quando false, retorna false sem enviar o indicador de digitacao.

**Metodo ih (updateStatus)**: Adicionada verificacao de `AyuConfig.sendOnlinePackets` no inicio do metodo. Quando false, retorna imediatamente sem enviar o status online.

### t2.smali (org/telegram/ui/Stories/t2.smali)

**Metodo G1 (readStories)**: Adicionada verificacao de `AyuConfig.sendReadPackets` no inicio do metodo. Quando false, retorna false sem marcar os stories como vistos.

## Processo de Build

O processo de build seguiu os seguintes passos.

1. **Descompilacao**: `apktool d Telegraph_12.3.1.1.apk` para extrair smali e recursos.
2. **Modificacao**: Edicao direta dos arquivos smali conforme descrito acima.
3. **Recompilacao dos DEX**: O apktool compilou com sucesso todos os 9 arquivos classes.dex.
4. **Substituicao no APK**: Os dex compilados foram injetados no APK original via Python/zipfile, preservando todos os recursos e o AndroidManifest.xml original.
5. **Alinhamento**: `zipalign -v -p 4` para alinhar o APK.
6. **Assinatura**: `apksigner sign` com chave RSA 2048-bit auto-gerada.

### Nota sobre o AndroidManifest.xml

O Telegraph usa nomes de classes obfuscados com caracteres Unicode arabes no AndroidManifest.xml, o que causa erro no aapt durante a recompilacao de recursos. A solucao foi substituir apenas os dex files no APK original, mantendo os recursos e manifest intactos.

## Verificacao

O APK final foi verificado com sucesso usando apksigner verify, confirmando assinaturas v1, v2 e v3.

## Estado das Funcionalidades

A tabela abaixo mostra o estado atual de cada funcionalidade implementada.

| Funcionalidade | Status | Detalhes |
|---|---|---|
| Anti-Delete sempre ativo | Implementado | NnnOfficial forcado para true |
| Ghost Mode - Nao ler mensagens | Implementado | Interceptacao em u9 (readHistory) |
| Ghost Mode - Ocultar digitando | Implementado | Interceptacao em Xf (setTyping) |
| Ghost Mode - Ocultar online | Implementado | Interceptacao em ih (updateStatus) |
| Ghost Mode - Nao ver stories | Implementado | Interceptacao em G1 (readStories) |
| Tela de configuracoes | Pendente | Necessita Activity smali complexa |
| Marca visual de deletado | Parcial | Anti-delete do Telegraph original |
| Banco de dados local | Pendente | Necessita SQLite helper |

## Proximos Passos

O proximo checkpoint (CP-003) focara em criar uma tela de configuracoes acessivel para que o usuario possa ativar/desativar as funcionalidades individualmente, e em adicionar marcas visuais nas mensagens deletadas/editadas.
