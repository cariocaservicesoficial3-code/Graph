# Graph - Telegraph Mod com Features do AyuGram

## Visao Geral do Projeto

Este projeto implementa as funcionalidades do **AyuGram 12.2.10** no **Telegraph 12.3.1.1**, criando um cliente Telegram modificado com recursos avancados de privacidade e espionagem. O Telegraph ja possui um sistema anti-delete basico (escondido na pagina Telegram Business), mas ele e limitado e inconveniente. Este mod substitui e aprimora esse sistema com as funcionalidades completas do AyuGram.

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

O Modo Fantasma permite controlar completamente sua visibilidade no Telegram, com as seguintes opcoes individuais que podem ser ativadas ou desativadas separadamente.

| Opcao | Descricao | Padrao |
|---|---|---|
| Nao visualizar mensagens | Nao envia confirmacao de leitura | Ativo |
| Nao visualizar Stories | Nao marca stories como vistos | Ativo |
| Ocultar Online | Nao envia status online | Ativo |
| Ocultar Digitando | Nao envia indicador de digitacao | Ativo |
| Ficar offline automaticamente | Envia pacote offline apos ficar online | Ativo |

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
| `org/telegram/Nnn/Official.smali` | Anti-delete flag | Substituido por sistema AyuGram |
| `org/telegram/messenger/Iq.smali` | MessagesController | Interceptar deleteMessages e readHistory |
| `org/telegram/messenger/bw.smali` | MessagesStorage | Persistencia de mensagens deletadas |
| `smali_classes7/org/telegram/ui/LaunchActivity` | Status online | Interceptar updateStatus |

### Novas Classes Adicionadas

Novas classes smali foram criadas no pacote `com/radolyn/ayugram/` para gerenciar as funcionalidades.

| Classe | Responsabilidade |
|---|---|
| `AyuConfig.smali` | Gerenciamento de todas as configuracoes via SharedPreferences |
| `AyuGhostConfig.smali` | Configuracoes especificas do Modo Fantasma |
| `AyuMessagesController.smali` | Controlador de salvamento de mensagens deletadas/editadas |
| `AyuPreferencesActivity.smali` | Tela de configuracoes do AyuGram |

## Checkpoints

Cada etapa do desenvolvimento e documentada como um checkpoint no repositorio.

| Checkpoint | Descricao | Status |
|---|---|---|
| CP-001 | Setup inicial e analise dos APKs | Concluido |
| CP-002 | Implementacao Anti-Delete | Em andamento |
| CP-003 | Implementacao Modo Fantasma | Pendente |
| CP-004 | Implementacao UI de Configuracoes | Pendente |
| CP-005 | Build e assinatura do APK final | Pendente |

## Como Compilar

O processo de compilacao envolve descompilar o Telegraph com apktool, aplicar as modificacoes smali, recompilar e assinar o APK resultante.

```bash
# Descompilar
apktool d Telegraph_12.3.1.1.apk -o telegraph-decompiled

# Aplicar patches (automatizado)
./apply_patches.sh

# Recompilar
apktool b telegraph-decompiled -o telegraph-modded.apk

# Assinar
apksigner sign --ks keystore.jks telegraph-modded.apk
```

## Creditos

Este projeto utiliza logica e conceitos do AyuGram (https://github.com/AyuGram/AyuGram4A), um fork do exteraGram com funcionalidades avancadas de privacidade. O Telegraph original e desenvolvido por NnnOfficial.

## Licenca

Este projeto e distribuido sob a licenca GPL-2.0, seguindo a mesma licenca do AyuGram e do Telegram.
