import os
from urllib.request import urlopen

from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer
config: ConfigAPI = config  # noqa: F821  # ty:ignore[unresolved-reference]
c: ConfigContainer = c # noqa: F821  # ty:ignore[unresolved-reference]

config.load_autoconfig(True)

c.backend = 'webengine'
c.content.javascript.enabled = True
c.colors.webpage.darkmode.enabled = True

if not os.path.exists(config.configdir / "theme.py"):
    theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
    with urlopen(theme) as themehtml:
        with open(config.configdir / "theme.py", "a") as file:
            file.writelines(themehtml.read().decode("utf-8"))

if os.path.exists(config.configdir / "theme.py"):
    import theme
    theme.setup(c, 'mocha', True)

config.bind('<z><l>', 'spawn --userscript pass.sh --d dmenu')
config.bind('<z><u><l>', 'spawn --userscript pass.sh --d dmenu --username-only')
config.bind('<z><p><l>', 'spawn --userscript pass.sh --d dmenu --password-only')
config.bind('<z><f>', 'spawn --userscript pass.sh --d dmenu --unfiltered')
