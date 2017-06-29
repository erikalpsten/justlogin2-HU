# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Policies" do
    describe "Admin" do
      describe "policies", type: :feature do
        refinery_login

        describe "policies list" do
          before do
            FactoryGirl.create(:policy, :name => "UniqueTitleOne")
            FactoryGirl.create(:policy, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.policies_admin_policies_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.policies_admin_policies_path

            click_link "Add New Policy"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Policies::Policy, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Policies::Policy, :count)

              expect(page).to have_content("Name can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:policy, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.policies_admin_policies_path

              click_link "Add New Policy"

              fill_in "Name", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Policies::Policy, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:policy, :name => "A name") }

          it "should succeed" do
            visit refinery.policies_admin_policies_path

            within ".actions" do
              click_link "Edit this policy"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            expect(page).to have_content("'A different name' was successfully updated.")
            expect(page).not_to have_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:policy, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.policies_admin_policies_path

            click_link "Remove this policy forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Policies::Policy.count).to eq(0)
          end
        end

      end
    end
  end
end
