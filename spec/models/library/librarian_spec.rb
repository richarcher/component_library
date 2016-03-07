require "rails_helper"

RSpec.describe Library::Librarian, :type => :model do
  before :each do
    @files = [ "/foo/bar/root_dir/_partial1",
              "/foo/bar/root_dir/directory/_partial2",
              "/foo/bar/root_dir/directory/_partial3"
            ]
  end

  context "#components" do
    it "returns an array of Library::Components" do
      librarian = Library::Librarian.new(@files, "/")
      expect(librarian.components.length).to eq 3
      expect(librarian.components[0]).to be_a_kind_of(Library::Component)
    end
  end

  context "#title" do
    it "returns a title if defined" do
      expect(Library::Librarian.new(@files, "/", "A title").title).to eq "A title"
    end

    it "returns an empty string if not defined" do
      expect(Library::Librarian.new(@files, "/").title).to eq ""
    end
  end

end