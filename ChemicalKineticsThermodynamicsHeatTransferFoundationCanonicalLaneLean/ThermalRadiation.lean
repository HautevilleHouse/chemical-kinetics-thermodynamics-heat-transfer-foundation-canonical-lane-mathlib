import ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean.HeatTransferConvection

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure RadiationHeatTransferPackage where
  surface : Type u
  emissivity : Type v
  absorptivity : Type w
  radiativeFlux : Type x
  stefanBoltzmannLaw : Prop
  kirchhoffLaw : Prop
  viewFactorRelation : Prop

structure RadiationHeatTransferEvidence (R : RadiationHeatTransferPackage) where
  stefanBoltzmannLawClosed : R.stefanBoltzmannLaw
  kirchhoffLawClosed : R.kirchhoffLaw
  viewFactorRelationClosed : R.viewFactorRelation

def RadiationHeatTransferClosed (R : RadiationHeatTransferPackage) : Prop :=
  R.stefanBoltzmannLaw ∧ R.kirchhoffLaw ∧ R.viewFactorRelation

theorem radiation_heat_transfer_closed_from_evidence (R : RadiationHeatTransferPackage) (E : RadiationHeatTransferEvidence R) :
    RadiationHeatTransferClosed R := by
  exact And.intro E.stefanBoltzmannLawClosed (And.intro E.kirchhoffLawClosed E.viewFactorRelationClosed)

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse