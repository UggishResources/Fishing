local Translations = {
    info = {
        ['fish_menu_headertext'] = 'Fiskemeny',
        ['fish_info_start'] = 'Hej! Vill du fiska? Gå till kartan och leta efter fiskestället. När du ser cirkeln, tryck på "E"',
        ['fish_info_sell'] = 'Sälj dina fiskar här',
        ['start_fishing'] = '~g~[E] För att börja fiska!',
        ['fish'] = 'Du fångade en ',
        ['sellitem_toped'] = 'Vill du sälja något? Gå till Peder!',
        ['desc_fishingmenu'] = 'Klicka här för mer information.',
        ['fishing_itemone_title'] = 'Föremål 1 för fiske',
        ['fishing_itemtwo_title'] = 'Föremål 2 för fiske',
        ['fishing_itemtre_title'] = 'Föremål 3 för fiske',
        ['fishing_items_desc'] = '',
        ['price_fish'] = 'Pris per styck: $%d',
        ['fish_again'] = 'Du kan fiska igen nu.',
        ['sold_fish'] = 'Du sålde dina fiskar för: ',
        ['need_fishrod'] = 'Tryck här för att låna ett fiskespö',
        ['fishingrod'] = 'Du har lånat ett fiskespö',
        ['target'] = 'Öppna fiskemenyn'
    },
    error = {
        ['not_fish'] = 'Du fångade ingen fisk!',
        ['timeout_fish'] = 'Du har fiskat 1 gång, du kan inte fiska mer just nu. Kom tillbaka senare om du vill fiska igen!',
        ['timeout_fish_again'] = 'Du har redan fiskat, vänligen vänta.',
        ['try_to_sellfish'] = 'Vad tror du? Du har inget att sälja till mig, idiot.',
        ['no_fishingrod'] = 'Du har inget fiskespö, du behöver gå till killen bakom dig.'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
