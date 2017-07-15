if Rails.env.development?
  print 'Seeding Admin...'
  User.find_or_create_by!(email: 'quannguyen@bestcoder.info') do |user|
    user.password = 123123123
  end
  puts ' Done!'

  PhotoAttr.find_or_create_by!(site: 'xkcn.info') do |pa|
    print 'Seeding crawler config for xkcn.info...'
    pa.name = 'article.photo'
    puts ' Done!'
  end

  print 'Seeding photo descriptions...'
  PhotoDescription.find_or_create_by!(description: 'Yêu cmnr :beauty:')
  PhotoDescription.find_or_create_by!(description: 'Làm người yêu em nhé baby :hugging_face:')
  PhotoDescription.find_or_create_by!(description: "You're my everything :innocent:")
  PhotoDescription.find_or_create_by!(description: "Anh là của em xin đừng là của ai :grin:")
  PhotoDescription.find_or_create_by!(description: "We don't talk anymore :stuck_out_tongue_closed_eyes:")
  puts ' Done!'

  print 'Seeding commands...'
  Command.find_or_create_by!(name: 'test', message: 'This is test message!')
  Command.find_or_create_by!(name: 'helloworld', message: 'Hello World :big-smile:')
  puts ' Done!'
end
