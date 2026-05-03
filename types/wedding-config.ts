export interface WeddingCouple {
  name1: string
  name2: string
  fullName1: string
  fullName2: string
  initials: string
  logo: string
  namesFont: string
  parentNames1: {
    father: string
    mother: string
  }
  parentNames2: {
    father: string
    mother: string
  }
}

export interface WeddingDate {
  weddingDate: string
  displayDate: string
  calendarMonthYear: string
  rsvpDeadline: string
  calendarSelectedDate: string
}

export interface WeddingVenue {
  name: string
  fullName: string
  position: { lat: number; lng: number }
  mapsUrl: string
  icon: string
}

export interface WeddingLocation {
  city: string
  church: WeddingVenue
  reception: WeddingVenue
  mapCenter: string
  mapZoom: number
}

export interface WeddingContactPerson {
  label: string
  phone: string
  phoneRaw: string
  whatsappMessage: string
}

export interface WeddingContact {
  groom: WeddingContactPerson
  bride: WeddingContactPerson
}

export interface WeddingBank {
  name: string
  holder: string
  accountNumber: string
  concept: string
}

export interface WeddingGifts {
  liverpoolUrl: string
  liverpoolUrlAlt: string
}

export interface WeddingImages {
  hero: string
  promise: string
  timelineBottom: string
  flowerCorner: string
  simpleFlower: string
  decorativeT: string
  disenoFloral1: string
  disenoFloral2: string
  disenoFloral3: string
  petalo: string
  novia: string
  novio: string
  dressCodeImg: string
  church: string
  churchWhite: string
  papelPicado: string
  carousel: string[]
  timeline: {
    gettingReady: string
    ceremony: string
    reception: string
    banquet: string
    firstDance: string
    party: string
    end: string
  }
  dressCodeWomen: string[]
  dressCodeMen: string[]
}

export interface TimelineEvent {
  time: string
  title: string
  description: string
  icon: string
}

export interface WeddingTexts {
  parentsIntro: string
  countdown: {
    celebration: string
    remaining: string
    days: string
    hours: string
    minutes: string
    seconds: string
  }
  saveDate: string
  promise: {
    title: string
    text: string
  }
  timeline: {
    title: string
    events: TimelineEvent[]
  }
  calendar: {
    dayNames: string[]
    selectedDayLabel: string
  }
  confirmation: {
    title: string
    codeLabel: string
    codePlaceholder: string
    codeHelp: string
    button: string
    loading: string
    notFound: string
    error: string
  }
  confirmPage: {
    title: string
    familyMessage: string
    companionMessage: string
    nameLabel: string
    confirmedLabel: string
    submitButton: string
    adultsOnly: string
    adultsOnlyLink: string
    footer: string
    footerThanks: string
    backButton: string
    modalTitle: string
    modalMessage: string
    successMessage: string
    errorMessage: string
  }
  dressCode: {
    title: string
    intro: string
    level: string
    womenLabel: string
    womenDescription: string
    womenRestriction: string
    menLabel: string
    menDescription: string
    menRestriction: string
    danceTitle: string
    danceDescription: string
    danceSuggestion: string
    womenCarouselTitle: string
    menCarouselTitle: string
  }
  contact: {
    title: string
  }
  gifts: {
    title: string
    intro: string
    giftButton: string
    bankButton: string
    footer: string
    footerThanks: string
  }
  bankPage: {
    title: string
    intro: string
    giftButton: string
    footer: string
    footerThanks: string
    backButton: string
  }
  copy: string
  copied: string
  nav: {
    giftRegistry: string
    requestInfo: string
    location: string
    dressCode: string
    confirmAttendance: string
  }
  footer: string
  modal: {
    title: string
    message: string
    confirm: string
    cancel: string
  }
}

export interface WeddingGuestSides {
  side1: string
  side2: string
  side1Label: string
  side2Label: string
}

export interface WeddingConfig {
  couple: WeddingCouple
  date: WeddingDate
  location: WeddingLocation
  contact: WeddingContact
  bank: WeddingBank
  gifts: WeddingGifts
  images: WeddingImages
  texts: WeddingTexts
  guestSides: WeddingGuestSides
}
