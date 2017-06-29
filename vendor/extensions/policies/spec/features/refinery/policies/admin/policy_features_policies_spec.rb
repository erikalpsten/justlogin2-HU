# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Policies" do
    describe "Admin" do
      describe "policy_features_policies", type: :feature do
        refinery_login

        describe "policy_features_policies list" do
          before do
            FactoryGirl.create(:policy_features_policy, :value => "UniqueTitleOne")
            FactoryGirl.create(:policy_features_policy, :value => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.policies_admin_policy_features_policies_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.policies_admin_policy_features_policies_path

            click_link "Add New Policy Features Policy"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Value", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Policies::PolicyFeaturesPolicy, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Policies::PolicyFeaturesPolicy, :count)

              expect(page).to have_content("Value can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:policy_features_policy, :value => "UniqueTitle") }

            it "should fail" do
              visit refinery.policies_admin_policy_features_policies_path

              click_link "Add New Policy Features Policy"

              fill_in "Value", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Policies::PolicyFeaturesPolicy, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:policy_features_policy, :value => "A value") }

          it "should succeed" do
            visit refinery.policies_admin_policy_features_policies_path

            within ".actions" do
              click_link "Edit this policy features policy"
            end

            fill_in "Value", :with => "A different value"
            click_button "Save"

            expect(page).to have_content("'A different value' was successfully updated.")
            expect(page).not_to have_content("A value")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:policy_features_policy, :value => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.policies_admin_policy_features_policies_path

            click_link "Remove this policy features policy forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Policies::PolicyFeaturesPolicy.count).to eq(0)
          end
        end

      end
    end
  end
end
