# Checkpoint CP-001: Setup Inicial e Analise dos APKs

## Data: 2026-03-28

## Resumo

Configuracao do ambiente de desenvolvimento e analise profunda de ambos os APKs (AyuGram 12.2.10 e Telegraph 12.3.1.1) para mapear as funcionalidades a serem implementadas.

## Ferramentas Instaladas

As seguintes ferramentas foram configuradas no ambiente de desenvolvimento para realizar a engenharia reversa.

| Ferramenta | Versao | Funcao |
|---|---|---|
| apktool | 2.9.3 | Descompilacao e recompilacao de APKs |
| JADX | 1.5.0 | Descompilacao para Java legivel |
| OpenJDK | 17.0.18 | Runtime Java para ferramentas |
| zipalign | 10.0.0 | Alinhamento de APK |
| apksigner | - | Assinatura digital de APK |

## Analise do AyuGram 12.2.10

O AyuGram e baseado no exteraGram e adiciona funcionalidades de privacidade. O codigo-fonte esta disponivel em https://github.com/AyuGram/AyuGram4A (branch rewrite). As classes principais ficam no pacote `com.radolyn.ayugram`.

### Arquivos-chave do AyuGram

A tabela abaixo lista os arquivos mais importantes do AyuGram que foram analisados.

| Arquivo | Tamanho | Funcao |
|---|---|---|
| AyuConfig.java | 8.520 bytes | Todas as configuracoes e SharedPreferences |
| AyuMessagesController.java | 9.794 bytes | Salvar mensagens deletadas e editadas |
| AyuGramPreferencesActivity.java | 26.179 bytes | Tela principal de preferencias |
| MessageSavingPreferencesActivity.java | 11.690 bytes | Configuracoes de salvamento |
| AyuUtils.java | 8.950 bytes | Utilitarios gerais |
| AyuForwarder.java | 8.764 bytes | Sistema de encaminhamento |

### Configuracoes do Ghost Mode

O Ghost Mode do AyuGram controla quatro parametros principais via SharedPreferences.

| Parametro | Chave SharedPreferences | Default | Efeito |
|---|---|---|---|
| sendReadPackets | "sendReadPackets" | true | Quando false, nao envia confirmacao de leitura |
| sendOnlinePackets | "sendOnlinePackets" | true | Quando false, nao envia status online |
| sendUploadProgress | "sendUploadProgress" | true | Quando false, nao envia progresso de upload |
| sendOfflinePacketAfterOnline | "sendOfflinePacketAfterOnline" | false | Quando true, envia offline apos online |

### Configuracoes de Espionagem

O sistema de espionagem salva mensagens deletadas e editadas em um banco de dados SQLite local.

| Parametro | Chave | Default | Efeito |
|---|---|---|---|
| saveDeletedMessages | "saveDeletedMessages" | true | Salvar mensagens que foram excluidas |
| saveMessagesHistory | "saveMessagesHistory" | true | Salvar historico de edicoes |
| saveMedia | "saveMedia" | false | Salvar midia de mensagens |
| saveForBots | "saveForBots" | true | Salvar mensagens de bots |
| markReadAfterSend | "markReadAfterSend" | true | Marcar como lido ao enviar |

## Analise do Telegraph 12.3.1.1

O Telegraph usa o pacote `ir.ilmili.telegraph` e possui classes customizadas obfuscadas no namespace `org.telegram.Nnn`.

### Estrutura de Classes Obfuscadas

As classes do Telegraph usam caracteres Unicode arabes como nomes, dificultando a leitura.

| Classe | Funcao Identificada |
|---|---|
| Official.smali | Gerencia o flag NnnOfficial (anti-delete) |
| Iq.smali | MessagesController - processa mensagens |
| bw.smali | MessagesStorage - armazenamento |
| S0.smali | Celula de UI que chama Delete/NnnDelete |

### Sistema Anti-Delete Original

O Telegraph possui um sistema anti-delete basico controlado pelo flag `NnnOfficial` na classe `Official.smali`. Este flag e ativado/desativado pela UI na pagina Telegram Business e requer scroll manual para funcionar. O metodo `setNnn(boolean)` salva o estado em SharedPreferences e o metodo `ۣ۟ۧۢۨ()` no `bw.smali` verifica se o anti-delete esta ativo.

### Pontos de Interceptacao Identificados

Os seguintes pontos no codigo do Telegraph serao modificados para implementar as funcionalidades do AyuGram.

| Local | Linha Aprox. | Funcao | Modificacao Planejada |
|---|---|---|---|
| Iq.smali | 91360 | readHistory | Interceptar para ghost mode |
| Iq.smali | 133099 | setTyping | Interceptar para ocultar digitando |
| Iq.smali | 148413 | updateStatus | Interceptar para ocultar online |
| bw.smali | 148008 | NnnOfficial check | Substituir por AyuConfig |
| Official.smali | - | setNnn | Redirecionar para AyuConfig |

## Proximos Passos

O proximo checkpoint (CP-002) implementara o sistema Anti-Delete aprimorado, substituindo o mecanismo basico do Telegraph pelo sistema completo do AyuGram com banco de dados SQLite local.
