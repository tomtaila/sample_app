require 'spec_helper'

describe User do
	before {@user = User.new(name: "Tom", email:"tomtaila@gmail.com", password: "password", password_confirmation: "password")}
	subject {@user}

	it {should respond_to(:name)}
	it {should respond_to(:email)}
	it {should respond_to(:password)}
	it {should respond_to(:password_confirmation)}
	it {should respond_to(:password_digest)}
	it {should respond_to(:authenticate)}

	it {should be_valid}

	describe "Blank name entry" do
		before{@user.name = " "}
		it {should_not be_valid}
	end

	describe "Blank email entry" do 
		before{@user.email = " "}
		it {should_not be_valid}
	end

	describe "Name entry longer than 20 characters" do
		before{@user.name = "A"*71}
		it {should_not be_valid}
	end

	describe "Email address entry longer than 200 characters" do
		before{@user.email = "A"*201}
		it {should_not be_valid}
	end

	describe "Email address already taken i.e. is NOT unique" do
		before do
			user2 = @user.dup
			user2.save
		end
		it {should_not be_valid}
	end

	describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

 	describe "when email format is valid" do
    	it "should be valid" do
      	addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      	addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "When password is empty" do
  	before do
  		@user.password = " "
  		@user.password_confirmation = " "
  	end
  	it {should_not be_valid}
  end

  describe "Password and Password_confirmation did not match" do
  	before {@user.password_confirmation = "InvalidPassword"}
  	it {should_not be_valid}
  end

  describe "Password authentication" do
  	before {@user.save}
  	let(:found_user) {User.find_by_email(@user.email)}

  	describe "Correct password entry" do
  		it {should eq found_user.authenticate(@user.password)}
  	end

  	describe "Incorrect password entry" do 
  		let(:found_user_with_invalid_pass) {found_user.authenticate("InvalidPassword")}

  		it {should_not eq found_user_with_invalid_pass} #eq checks for equality
		  it { expect(found_user_with_invalid_pass).to be_false }
  	end

  end

  describe "Password entry too short" do
    before {@user.password = "A" * 5}
    it {should_not be_valid}
  end

  describe "Email address with mixed case" do 
    let(:mixed_case_email) {"ToMTaIlA@HoTmAiL.cOm"}
    it "Email should be converted to downcased email before save" do
      @user.email = mixed_case_email
      @user.save
      expect(@user.email).to eq mixed_case_email.downcase
    end
    
  end












end
