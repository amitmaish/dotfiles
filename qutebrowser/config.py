import os
from urllib.request import urlopen

# pylint: disable=C0111
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401
config: ConfigAPI = config  # noqa: F821 pylint: disable=E0602,C0103
c: ConfigContainer = c  # noqa: F821 pylint: disable=E0602,C0103

config.load_autoconfig(True)

c.backend = 'webengine'
c.content.javascript.enabled = True

if not os.path.exists(config.configdir / "theme.py"):
    theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
    with urlopen(theme) as themehtml:
        with open(config.configdir / "theme.py", "a") as file:
            file.writelines(themehtml.read().decode("utf-8"))

if os.path.exists(config.configdir / "theme.py"):
    import theme
    theme.setup(c, 'mocha', True)

config.bind('<z><l>', r'spawn --userscript pass.sh --username-target secret --username-pattern \'username: (.*)\'')
config.bind('<z><u>', r'spawn --userscript pass.sh --unfiltered --username-target secret --username-pattern \'username: (.*)\'')
