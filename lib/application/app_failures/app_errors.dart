enum AppErrors {
  noErrors,
  images,
  title,
  description,
  sizes,
  price,
  tags,
  name,
  phoneInvalid,
  phoneEmpty,
  password,
  pinCodeEmpty,
  pinCodeInvalid,


}

const Map<AppErrors, String> appErrorMessages = {
  AppErrors.noErrors: '',
  AppErrors.images: 'at least provide one image',
  AppErrors.title: 'title is required',
  AppErrors.description: 'description is required',
  AppErrors.tags: 'tags is required',
  AppErrors.price: 'price is required',
  AppErrors.name: 'name is required',
  AppErrors.phoneInvalid: 'invalid phone number',
  AppErrors.phoneEmpty: 'phone is required',
  AppErrors.password: 'password must be at least 8 digits',
  AppErrors.pinCodeEmpty: 'Please Enter Sent Code',
  AppErrors.pinCodeInvalid: 'Pin Code must be 4 numbers',
};
