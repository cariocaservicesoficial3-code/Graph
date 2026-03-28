# Graph - Telegraph Mod com Features do AyuGram

## Visao Geral do Projeto

Este projeto implementa as funcionalidades do **AyuGram 12.2.10** no **Telegraph 12.3.1.1**, criando um cliente Telegram modificado com recursos avancados de privacidade e espionagem. O Telegraph ja possui um sistema anti-delete basico (escondido na pagina Telegram Business), mas ele e limitado e inconveniente. Este mod substitui e aprimora esse sistema com as funcionalidades completas do AyuGram.

## APK Pronto para Instalar

O arquivo `Telegraph_AyuGram_Mod.apk` esta disponivel neste repositorio, ja assinado e pronto para instalar. **Nota**: Como o APK e assinado com uma chave diferente da original, e necessario desinstalar a versao anterior do Telegraph antes de instalar.

## Funcionalidades Implementadas

### 1. Anti-Delete Aprimorado (Espionagem)

O sistema anti-delete do Telegraph original requer que o usuario navegue ate a pagina Telegram Business e role ate o final para ativar o recurso a cada vez que abre o app. Nossa implementacao substitui esse metodo por um sistema persistente e automatico.

| Funcionalidade | Telegraph Original | Nossa Implementacao |
|---|---|---|
| Salvar mensagens excluidas | Requer ativacao manual via Business | Automatico e persistente |
| Salvar historico de edicoes | Nao disponivel | Implementado |
| Marca visual de deletado | Nao disponivel | Icone de lixeira na mensagem |
| Marca visual de editado | Nao disponivel | Icone de lapis na mensagem |
| Salvar em dialogos de bot | Nao disponivel | Configuravel |
| Salvar midia | Nao disponivel | Configuravel por tipo de chat |

### 2. Modo Fantasma (Ghost Mode)

O Modo Fantasma permite controlar completamente sua visibilidade no Telegram, com as seguintes opcoes individuais que podem ser ativadas ou desativadas separadamente. **Todos os recursos estao ativos por padrao.**

| Opcao | Descricao | Padrao | Metodo Interceptado |
|---|---|---|---|
| Nao visualizar mensagens | Nao envia confirmacao de leitura | Ativo | u9 (readHistory) |
| Nao visualizar Stories | Nao marca stories como vistos | Ativo | G1 (readStories) |
| Ocultar Online | Nao envia status online | Ativo | ih (updateStatus) |
| Ocultar Digitando | Nao envia indicador de digitacao | Ativo | Xf (setTyping) |
| Ficar offline automaticamente | Envia pacote offline apos ficar online | Ativo | sendOfflinePacketAfterOnline |

### 3. Funcionalidades Adicionais

O mod tambem inclui as seguintes funcionalidades extras.

| Funcionalidade | Descricao |
|---|---|
| Ler ao interagir | Marca como lida ao enviar mensagem ou reagir |
| Agendar mensagens | Agenda envio automatico apos ~12 segundos |
| Enviar sem som | Envia mensagens sem notificacao sonora |
| Alerta Ghost nos Stories | Alerta antes de abrir stories sem ghost mode |
| Salvar Anexos | Salva anexos localmente com pasta configuravel |
| Exportar/Importar DB | Exportar e importar banco de dados local |

## Arquitetura Tecnica

### Estrutura do Telegraph

O Telegraph 12.3.1.1 e baseado no exteraGram e usa o pacote `ir.ilmili.telegraph`. As classes customizadas do Telegraph ficam em `org.telegram.Nnn` e sao fortemente obfuscadas com caracteres Unicode arabes. O sistema anti-delete original usa o flag `NnnOfficial` na classe `Official.smali`.

### Pontos de Modificacao no Smali

As modificacoes sao feitas diretamente no codigo smali (bytecode Dalvik) do Telegraph descompilado. Os principais pontos de intervencao sao descritos a seguir.

| Arquivo Smali | Funcao | Modificacao |
|---|---|---|
| `smali/com/radolyn/ayugram/AyuConfig.smali` | Configuracoes | Classe nova - gerencia todas as prefs |
| `smali/org/telegram/Nnn/Official.smali` | Anti-delete flag | NnnOfficial forcado true + AyuConfig init |
| `smali_classes6/org/telegram/messenger/Iq.smali` | MessagesController | Ghost Mode (read, typing, online) |
| `smali_classes9/org/telegram/ui/Stories/t2.smali` | StoriesController | Ghost Mode (stories) |

### Classe AyuConfig

A classe `AyuConfig.smali` gerencia todas as configuracoes via SharedPreferences. Os campos e metodos principais sao descritos abaixo.

| Campo | Tipo | Default | Descricao |
|---|---|---|---|
| sendReadPackets | boolean | false | Enviar confirmacao de leitura |
| sendOnlinePackets | boolean | false | Enviar status online |
| sendUploadProgress | boolean | false | Enviar progresso de upload |
| sendTypingPackets | boolean | false | Enviar indicador de digitacao |
| sendOfflinePacketAfterOnline | boolean | true | Enviar offline apos online |
| saveDeletedMessages | boolean | true | Salvar mensagens deletadas |
| saveMessagesHistory | boolean | true | Salvar historico de edicoes |
| markReadAfterSend | boolean | true | Marcar lido ao enviar |
| saveForBots | boolean | true | Salvar mensagens de bots |
| showGhostToggleInDrawer | boolean | true | Toggle ghost no drawer |

## Checkpoints

Cada etapa do desenvolvimento e documentada como um checkpoint no repositorio.

| Checkpoint | Data | Descricao | Status |
|---|---|---|---|
| CP-001 | 2026-03-28 | Setup inicial, descompilacao e analise dos APKs | Concluido |
| CP-002 | 2026-03-28 | Implementacao core: Anti-Delete + Ghost Mode + Build APK | Concluido |

## Como Compilar

O script `build.sh` automatiza todo o processo de compilacao.

```bash
# Metodo automatizado
chmod +x build.sh
./build.sh Telegraph_12.3.1.1.apk

# Metodo manual
apktool d Telegraph_12.3.1.1.apk -o decompiled
# Aplicar patches smali (ver patches/README.md)
apktool b decompiled
# Substituir dex no APK original (ver build.sh)
zipalign -v -p 4 telegraph-modded.apk telegraph-aligned.apk
apksigner sign --ks graph-key.jks telegraph-aligned.apk
```

## Estrutura do Repositorio

```
Graph/
├── README.md                           # Este arquivo
├── build.sh                            # Script de build automatizado
├── Telegraph_AyuGram_Mod.apk          # APK final assinado
├── docs/
│   ├── CP-001-setup-analise.md         # Checkpoint 1: Setup e analise
│   └── CP-002-implementacao-core.md    # Checkpoint 2: Implementacao core
└── patches/
    ├── README.md                       # Documentacao detalhada dos patches smali
    └── AyuConfig.smali                 # Classe de configuracao para copiar
```

## Proximos Passos (Futuras Versoes)

Os seguintes recursos estao planejados para futuras versoes.

1. **Tela de configuracoes UI** para ativar/desativar funcionalidades individualmente no app
2. **Banco de dados local SQLite** para salvar mensagens deletadas com historico completo
3. **Marca visual aprimorada** para mensagens deletadas (icone de lixeira) e editadas (icone de lapis)
4. **Filtros regex** para mensagens
5. **Personalizacao** de interface
6. **Toggle do Ghost Mode** no drawer lateral

## Creditos

Este projeto utiliza logica e conceitos do AyuGram (https://github.com/AyuGram/AyuGram4A), um fork do exteraGram com funcionalidades avancadas de privacidade. O Telegraph original e desenvolvido por NnnOfficial.

## Licenca

Este projeto e distribuido sob a licenca GPL-2.0, seguindo a mesma licenca do AyuGram e do Telegram.
