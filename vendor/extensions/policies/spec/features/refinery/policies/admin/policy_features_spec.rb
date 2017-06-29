# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Policies" do
    describe "Admin" do
      describe "policy_features", type: :feature do
        refinery_login

        describe "policy_features list" do
          before do
            FactoryGirl.create(:policy_feature, :name => "UniqueTitleOne")
            FactoryGirl.create(:policy_feature, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.policies_admin_policy_features_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.policies_admin_policy_features_path

            click_link "Add New Policy Feature"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Policies::PolicyFeature, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Policies::PolicyFeature, :count)

              expect(page).to have_content("Name can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:policy_feature, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.policies_admin_policy_features_path

              click_link "Add New Policy Feature"

              fill_in "Name", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Policies::PolicyFeature, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:policy_feature, :name => "A name") }

          it "should succeed" do
            visit refinery.policies_admin_policy_features_path

            within ".actions" do
              click_link "Edit this policy feature"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            expect(page).to have_content("'A different name' was successfully updated.")
            expect(page).not_to have_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:policy_feature, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.policies_admin_policy_features_path

            click_link "Remove this policy feature forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Policies::PolicyFeature.count).to eq(0)
          end
        end

      end
    end
  end
end
