Bureaucrat.start(
 writer: Bureaucrat.MarkdownWriter,
 default_path: "docs/api.md",
 paths: [],
 titles: [],
  env_var: "DOC"
)
ExUnit.start(formatters: [ExUnit.CLIFormatter, Bureaucrat.Formatter])
Ecto.Adapters.SQL.Sandbox.mode(StoreCore.Repo, :manual)
