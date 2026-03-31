@echo off
setlocal

if "%CLAUDE_OLLAMA_MODEL%"=="" set "CLAUDE_OLLAMA_MODEL=qwen3:1.7b"

where ollama >nul 2>nul
if errorlevel 1 (
  echo Ollama is not installed on PATH.
  exit /b 1
)

where claude >nul 2>nul
if errorlevel 1 (
  echo Claude Code is not installed on PATH.
  echo Install it with: npm.cmd install -g @anthropic-ai/claude-code
  exit /b 1
)

if "%~1"=="" (
  ollama launch claude --model %CLAUDE_OLLAMA_MODEL%
) else (
  ollama launch claude --model %CLAUDE_OLLAMA_MODEL% -- %*
)
