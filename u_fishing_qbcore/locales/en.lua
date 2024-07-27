local Translations = {
    info = {
        ['fish_menu_headertext'] = 'Fishing Menu',
        ['fish_info_start'] = 'Hello! If you want to go fishing? Go to the map and look for the fishing spot. When you see the circle, press "E"',
        ['fish_info_sell'] = 'Sell your fishes here',
        ['start_fishing'] = '~g~[E] To start fishing!',
        ['fish'] = 'You caught a ',
        ['sellitem_toped'] = 'If you want to sell something? Go to Peder!',
        ['desc_fishingmenu'] = 'Click here for more information.',
        ['fishing_itemone_title'] = 'Fishing Item 1',
        ['fishing_itemtwo_title'] = 'Fishing Item 2',
        ['fishing_itemtre_title'] = 'Fishing Item 3',
        ['fishing_items_desc'] = '',
        ['price_fish'] = 'Price for one: $%d',
        ['fish_again'] = 'You can fish again now.',
        ['sold_fish'] = 'You Sold Your Fishes For: ',
        ['need_fishrod'] = 'Press here to borrow a fishing rod',
        ['fishingrod'] = 'You borrowed a fishing rod',
        ['target'] = 'Open Fishing Menu'
    },
    error = {
        ['not_fish'] = 'You didnt catch a fish!', 
        ['timeout_fish'] = 'You have fished 1 times, you cannot fish anymore right now. Come back later if you want to fish again!',
        ['timeout_fish_again'] = 'You have fished already, please wait.',
        ['try_to_sellfish'] = 'What do you think? You dont have anything that you can sell to me idiot.',
        ['no_fishingrod'] = 'You dont have a fishing rod, you need to go to the guy behind you.'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})