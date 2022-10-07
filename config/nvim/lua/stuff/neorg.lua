require('neorg').setup({
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/Documents/orgs/work",
                    school = "~/Documents/orgs/school"
                }
            }
        },
        ['core.norg.concealer'] = {},
        ['core.norg.completion'] = {
            config = {
                engine = 'nvim-cmp'
            }
        },
        ['core.integrations.telescope'] = {}
    }
})
