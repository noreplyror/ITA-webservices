module ScreeningList
  class NonUsRpl
    include Indexable
    include ScreeningList::NonUsMappable
    self.source = {
      full_name: 'Restricted Party List (Non US RPL)',
      code:      'Non US RPL',
    }
  end
end