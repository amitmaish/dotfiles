from themes import city_lights

from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer
config: ConfigAPI = config  # noqa: F821  # ty:ignore[unresolved-reference]
c: ConfigContainer = c # noqa: F821  # ty:ignore[unresolved-reference]

config.load_autoconfig(True)

c.backend = 'webengine'
c.content.javascript.enabled = True
c.colors.webpage.darkmode.enabled = True

city_lights.setup(config)

config.bind('<z><l>', 'spawn --userscript pass.sh --d dmenu')
config.bind('<z><u><l>', 'spawn --userscript pass.sh --d dmenu --username-only')
config.bind('<z><p><l>', 'spawn --userscript pass.sh --d dmenu --password-only')
config.bind('<z><f>', 'spawn --userscript pass.sh --d dmenu --unfiltered')
